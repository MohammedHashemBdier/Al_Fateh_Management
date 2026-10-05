import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/app_snackbars.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/services/services.dart';
import '../../../../core/widgets/widgets.dart';
import '../../data/repositories/tickets_repository_impl.dart';
import '../../domain/models/ticket_model.dart';
import '../cubit/tickets_cubit.dart';
import '../cubit/tickets_state.dart';
import 'widgets/ticket_add_dialog.dart';
import 'widgets/ticket_card.dart';
import 'widgets/ticket_data_table.dart';
import 'widgets/ticket_details_dialog.dart';
import 'widgets/ticket_filter_bar.dart';
import 'widgets/ticket_sync_badge.dart';

/// الشاشة الرئيسية المتكاملة لإدارة التذاكر والدعم الفني
class TicketsView extends StatelessWidget {
  const TicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TicketsCubit(repository: TicketsRepositoryImpl())..loadTickets(),
      child: const _TicketsViewContent(),
    );
  }
}

class _TicketsViewContent extends StatelessWidget {
  const _TicketsViewContent();

  void _openAddTicketDialog(BuildContext context, TicketsState state) {
    final cubit = context.read<TicketsCubit>();
    final user = state.currentUser?.fullName ?? 'الدعم الفني';

    TicketAddDialog.show(
      context,
      problems: state.problemTypes,
      employees: state.employeeList,
      currentUser: user,
      onSave: (ticket) => cubit.addTicket(ticket),
      onAddNewProblem: (name) => cubit.addProblemType(name, userId: user),
    );
  }

  void _openDetailsDialog(
    BuildContext context,
    TicketModel ticket,
    TicketsState state,
  ) {
    final cubit = context.read<TicketsCubit>();
    final user = state.currentUser?.fullName ?? 'الدعم الفني';

    TicketDetailsDialog.show(
      context,
      ticket: ticket,
      statuses: state.statusList,
      employees: state.employeeList,
      currentUser: user,
      onDelete: (rowId) => cubit.deleteTicket(rowId),
      onUpdate:
          ({
            required int rowId,
            String? status,
            String? solution,
            String? description,
            String? employee,
            String? problem,
            required String actorName,
            String? auditNote,
          }) => cubit.updateTicket(
            rowId: rowId,
            status: status,
            solution: solution,
            description: description,
            employee: employee,
            problem: problem,
            actorName: actorName,
            auditNote: auditNote,
          ),
    );
  }

  Future<void> _confirmCloseAllTickets(
    BuildContext context,
    TicketsCubit cubit,
  ) async {
    final confirmed = await AppDialogService.warning(
      context: context,
      title: context.tr('tickets_bulk_close_title'),
      message: context.tr('tickets_bulk_close_confirm'),
      confirmText: context.tr('confirm'),
      cancelText: context.tr('cancel'),
    );

    if (confirmed && context.mounted) {
      await cubit.closeAllOpenTickets();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isCompact = context.isMobile;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        } else {
          context.go('/home');
        }
      },
      child: BlocConsumer<TicketsCubit, TicketsState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            AppSnackbars.showError(context, state.errorMessage!);
            context.read<TicketsCubit>().clearMessages();
          } else if (state.successMessage != null) {
            AppSnackbars.showSuccess(
              context,
              context.tr(state.successMessage!),
            );
            context.read<TicketsCubit>().clearMessages();
          }
        },
        builder: (context, state) {
          final cubit = context.read<TicketsCubit>();
          final canCloseAll =
              state.currentUser?.roleId == 'ROLE_ADMIN' ||
              state.currentUser?.roleId == 'ROLE_GM';

          return AppListScaffold(
            title: 'nav_tickets',
            user: state.currentUser,
            currentRoute: '/tickets',
            showBackButton: true,
            onBackPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                context.go('/home');
              }
            },
            extraActions: [
              if (canCloseAll) ...[
                AppTooltip(
                  message: context.tr('close_all_tickets_btn'),
                  child: IconButton(
                    icon: Icon(Icons.done_all_rounded, color: colors.tertiary),
                    onPressed: () => _confirmCloseAllTickets(context, cubit),
                  ),
                ),
                const SizedBox(width: 4),
              ],
              TicketSyncBadge(
                isOffline: state.isOffline,
                isSyncing: state.isSyncing,
                pendingCount: state.pendingSyncCount,
                onSyncNow: () => cubit.syncNow(),
              ),
              const SizedBox(width: 4),
              AppTooltip(
                message: context.tr('refresh'),
                child: IconButton(
                  icon: const Icon(Icons.refresh_rounded),
                  onPressed: () => cubit.loadTickets(forceRefresh: true),
                ),
              ),
            ],
            withDividers: false,
            headerPadding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            footerPadding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            filterHeader: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ترويسة الشاشة مع العنوان المريح والتوصيف دون تضييق
                AppFadeSlide(
                  delay: const Duration(milliseconds: 40),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.titleLarge(
                              'tickets_view_title',
                              fontSize: isCompact ? 16 : 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppAssets.fontSecondary,
                              color: colors.onSurface,
                            ),
                            const SizedBox(height: 2),
                            AppText.caption(
                              'tickets_view_desc',
                              fontSize: 12,
                              color: colors.onSurfaceVariant,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // شريط البحث والفلاتر المتقدم
                AppFadeSlide(
                  delay: const Duration(milliseconds: 80),
                  child: TicketFilterBar(
                    filter: state.filter,
                    problems: state.problemTypes,
                    statuses: state.statusList,
                    employees: state.employeeList,
                    isTableView: state.showTableView(isCompact),
                    totalCount: state.allTickets.length,
                    filteredCount: state.filteredTickets.length,
                    onSearch: (q) => cubit.onSearchChanged(q),
                    onFilterChange: (f) => cubit.applyFilter(f),
                    onReset: () => cubit.resetFilters(),
                    onToggleView: (isTable) => cubit.toggleViewMode(isTable),
                    onAddTicket: () => _openAddTicketDialog(context, state),
                  ),
                ),

                // شريط العمليات الجماعية (Bulk Actions) عند تحديد عناصر
                if (state.selectedTicketIds.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  AppFadeSlide(
                    delay: const Duration(milliseconds: 50),
                    scaleIn: true,
                    child: _buildBulkActionBar(context, state, cubit),
                  ),
                ],
              ],
            ),
            listBody: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AppFadeSlide(
                delay: const Duration(milliseconds: 120),
                child: _buildMainContent(context, state, cubit, isCompact),
              ),
            ),
            paginationFooter: state.filteredTickets.isNotEmpty
                ? AppFadeSlide(
                    delay: const Duration(milliseconds: 160),
                    child: AppPaginationBar(
                      currentPage: state.currentPage,
                      totalPages: state.totalPages,
                      totalCount: state.filteredTickets.length,
                      pageSize: state.pageSize,
                      onPageChanged: (p) => cubit.goToPage(p),
                      onPageSizeChanged: (s) => cubit.changePageSize(s),
                    ),
                  )
                : null,
          );
        },
      ),
    );
  }

  Widget _buildMainContent(
    BuildContext context,
    TicketsState state,
    TicketsCubit cubit,
    bool isCompact,
  ) {
    return AppAnimatedSwitch(
      child: _buildContentChild(context, state, cubit, isCompact),
    );
  }

  Widget _buildContentChild(
    BuildContext context,
    TicketsState state,
    TicketsCubit cubit,
    bool isCompact,
  ) {
    if (state.isLoading) {
      return ListView.builder(
        key: const ValueKey('tickets_loading_list'),
        itemCount: 6,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: AppFadeSlide(
            delay: Duration(milliseconds: index * 40),
            child: const AppSkeleton(height: 80, borderRadius: 12),
          ),
        ),
      );
    }

    if (state.filteredTickets.isEmpty) {
      return KeyedSubtree(
        key: const ValueKey('tickets_empty_state'),
        child: AppEmptyState(
          title: context.tr('no_tickets_found_title'),
          subtitle: context.tr('no_tickets_found_desc'),
          icon: Icons.search_off_rounded,
          actionLabel: state.filter.hasActiveFilters
              ? context.tr('clear_filters')
              : null,
          onAction: state.filter.hasActiveFilters
              ? () => cubit.resetFilters()
              : null,
        ),
      );
    }

    // التبديل بين طريقة العرض (جدول أو بطاقات) وفق حجم الشاشة أو اختيار المستخدم
    final showTable = state.showTableView(isCompact);

    if (showTable) {
      return KeyedSubtree(
        key: const ValueKey('tickets_table_view'),
        child: AppFadeSlide(
          scaleIn: true,
          initialScale: 0.98,
          duration: const Duration(milliseconds: 260),
          child: TicketDataTable(
            tickets: state.paginatedTickets,
            selectedIds: state.selectedTicketIds,
            searchQuery: state.filter.searchQuery,
            sortField: state.filter.sortField,
            sortDirection: state.filter.sortDirection,
            onSort: (field) => cubit.sort(field),
            onToggleSelect: (id) => cubit.toggleTicketSelection(id),
            onSelectAll: (val) => cubit.toggleSelectAll(val),
            onTicketTap: (t) => _openDetailsDialog(context, t, state),
            onEditTap: (t) => _openDetailsDialog(context, t, state),
          ),
        ),
      );
    }

    return KeyedSubtree(
      key: const ValueKey('tickets_cards_list'),
      child: ListView.builder(
        itemCount: state.paginatedTickets.length,
        itemBuilder: (context, index) {
          final ticket = state.paginatedTickets[index];
          return AppFadeSlide(
            delay: Duration(milliseconds: (index.clamp(0, 8)) * 35),
            scaleIn: true,
            initialScale: 0.96,
            child: TicketCard(
              ticket: ticket,
              onTap: () => _openDetailsDialog(context, ticket, state),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBulkActionBar(
    BuildContext context,
    TicketsState state,
    TicketsCubit cubit,
  ) {
    final colors = context.colors;
    final count = state.selectedTicketIds.length;

    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      backgroundColor: colors.primaryContainer.withValues(alpha: 0.35),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline_rounded,
            size: 20,
            color: colors.primary,
          ),
          const SizedBox(width: 8),
          AppText.bodySmall(
            '${context.tr('selected_items')}: $count',
            isTranslated: false,
            fontWeight: FontWeight.bold,
            color: colors.onSurface,
          ),
          const Spacer(),
          AppButton(
            label: context.tr('clear_selection'),
            icon: Icons.clear_rounded,
            variant: AppButtonVariant.text,
            height: 36,
            customColor: colors.error,
            onPressed: () => cubit.toggleSelectAll(false),
          ),
        ],
      ),
    );
  }
}
