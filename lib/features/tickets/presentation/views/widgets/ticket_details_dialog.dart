import 'package:flutter/material.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/services/services.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/models/ticket_model.dart';

/// نافذة تفاصيل التذكرة، تحديث الحالة والحل، وسجل التدقيق الزمني
class TicketDetailsDialog extends StatefulWidget {
  final TicketModel ticket;
  final List<String> statuses;
  final List<String> employees;
  final String currentUser;
  final Future<bool> Function({
    required int rowId,
    String? status,
    String? solution,
    String? description,
    String? employee,
    String? problem,
    required String actorName,
    String? auditNote,
  }) onUpdate;
  final Future<bool> Function(int rowId)? onDelete;

  const TicketDetailsDialog({
    super.key,
    required this.ticket,
    required this.statuses,
    required this.employees,
    required this.currentUser,
    required this.onUpdate,
    this.onDelete,
  });

  static Future<bool?> show(
    BuildContext context, {
    required TicketModel ticket,
    required List<String> statuses,
    required List<String> employees,
    required String currentUser,
    required Future<bool> Function({
      required int rowId,
      String? status,
      String? solution,
      String? description,
      String? employee,
      String? problem,
      required String actorName,
      String? auditNote,
    }) onUpdate,
    Future<bool> Function(int rowId)? onDelete,
  }) {
    return AppDialogService.custom<bool>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => TicketDetailsDialog(
        ticket: ticket,
        statuses: statuses,
        employees: employees,
        currentUser: currentUser,
        onUpdate: onUpdate,
        onDelete: onDelete,
      ),
    );
  }

  @override
  State<TicketDetailsDialog> createState() => _TicketDetailsDialogState();
}

class _TicketDetailsDialogState extends State<TicketDetailsDialog>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String _selectedStatus;
  late String _selectedEmployee;
  late TextEditingController _solutionController;
  late TextEditingController _notesController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _selectedStatus = widget.ticket.status;
    _selectedEmployee = widget.ticket.employee;
    _solutionController =
        TextEditingController(text: widget.ticket.solution);
    _notesController = TextEditingController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _solutionController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _handleSaveUpdate() async {
    setState(() => _isLoading = true);

    final success = await widget.onUpdate(
      rowId: widget.ticket.rowId,
      status: _selectedStatus,
      solution: _solutionController.text.trim(),
      employee: _selectedEmployee,
      actorName: widget.currentUser,
      auditNote: _notesController.text.trim().isNotEmpty
          ? _notesController.text.trim()
          : null,
    );

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (success) {
      Navigator.of(context).pop(true);
    }
  }

  Future<void> _handleDelete() async {
    final confirmed = await AppDialogService.danger(
      context: context,
      title: context.tr('confirm_delete_ticket_title'),
      message: context.tr('confirm_delete_ticket_msg'),
      confirmText: context.tr('delete'),
      cancelText: context.tr('cancel'),
    );

    if (confirmed == true && mounted && widget.onDelete != null) {
      setState(() => _isLoading = true);
      final success = await widget.onDelete!(widget.ticket.rowId);
      if (!mounted) return;
      setState(() => _isLoading = false);
      if (success) {
        Navigator.of(context).pop(true);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Dialog(
      backgroundColor: colors.surface,
      surfaceTintColor: colors.surfaceTint,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: AppFadeSlide(
        scaleIn: true,
        initialScale: 0.94,
        duration: const Duration(milliseconds: 260),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680, maxHeight: 760),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // الرأس: رقم التذكرة ومعلومات المشترك الأساسية
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: colors.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: AppText.literal(
                      '#${widget.ticket.rowId > 0 ? widget.ticket.rowId : 'OFFLINE'}',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: colors.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.title(
                          widget.ticket.subscriberName,
                          isTranslated: false,
                          fontFamily: AppAssets.fontSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: colors.onSurface,
                        ),
                        AppText.caption(
                          '${widget.ticket.landline}  •  ${widget.ticket.date} ${widget.ticket.time}',
                          isTranslated: false,
                          fontSize: 12,
                          color: colors.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                  AppStatusBadge(status: widget.ticket.status),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // التبويبات: التفاصيل والتحديث / سجل التدقيق
              TabBar(
                controller: _tabController,
                labelColor: colors.primary,
                unselectedLabelColor: colors.onSurfaceVariant,
                indicatorColor: colors.primary,
                tabs: [
                  Tab(text: context.tr('tab_ticket_details')),
                  Tab(
                    text:
                        '${context.tr('tab_audit_trail')} (${widget.ticket.auditTrail.length})',
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // محتوى التبويب
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildDetailsTab(context),
                    _buildAuditTrailTab(context),
                  ],
                ),
              ),

              const SizedBox(height: 12),
              Divider(color: colors.outlineVariant.withValues(alpha: 0.3)),
              const SizedBox(height: 8),

              // الأزرار السفلية
              Row(
                children: [
                  if (widget.onDelete != null)
                    AppButton(
                      label: context.tr('delete'),
                      icon: Icons.delete_outline_rounded,
                      variant: AppButtonVariant.text,
                      customColor: colors.error,
                      height: 38,
                      onPressed: _isLoading ? null : _handleDelete,
                    ),
                  const Spacer(),
                  AppButton(
                    label: context.tr('close'),
                    variant: AppButtonVariant.ghost,
                    customColor: colors.onSurfaceVariant,
                    height: 38,
                    onPressed:
                        _isLoading ? null : () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 12),
                  AppButton(
                    label: context.tr('save_changes'),
                    icon: Icons.check_circle_rounded,
                    isLoading: _isLoading,
                    onPressed: _handleSaveUpdate,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

  Widget _buildDetailsTab(BuildContext context) {
    final colors = context.colors;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // بطاقة معلومات المشكلة الأصلية
          AppCard(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.report_problem_outlined,
                        size: 18, color: colors.tertiary),
                    const SizedBox(width: 8),
                    AppText.literal(
                      widget.ticket.problem,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: colors.onSurface,
                    ),
                  ],
                ),
                if (widget.ticket.description.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  AppText.literal(
                    widget.ticket.description,
                    fontSize: 13,
                    color: colors.onSurfaceVariant,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 14),

          // تحديث الحالة بنقرة واحدة
          AppText.label(
            'update_status_label',
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: colors.onSurface,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.statuses.map((statusName) {
              final isSelected = _selectedStatus == statusName;
              return ChoiceChip(
                label: AppText.literal(
                  statusName,
                  fontSize: 12,
                  fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? colors.onPrimaryContainer
                      : colors.onSurface,
                ),
                selected: isSelected,
                selectedColor: colors.primaryContainer,
                backgroundColor: colors.surfaceContainerLow,
                onSelected: (val) {
                  if (val) setState(() => _selectedStatus = statusName);
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

          // الموظف المسؤول
          AppText.label(
            'assigned_to_label',
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: colors.onSurface,
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: colors.outlineVariant.withValues(alpha: 0.35),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedEmployee.isNotEmpty &&
                        widget.employees.contains(_selectedEmployee)
                    ? _selectedEmployee
                    : null,
                hint: AppText.literal(
                  _selectedEmployee.isNotEmpty
                      ? _selectedEmployee
                      : context.tr('unassigned'),
                  fontSize: 13,
                  color: colors.onSurface,
                ),
                isExpanded: true,
                items: widget.employees.map((emp) {
                  return DropdownMenuItem<String>(
                    value: emp,
                    child: AppText.literal(
                      emp,
                      fontSize: 13,
                      color: colors.onSurface,
                    ),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _selectedEmployee = val);
                },
              ),
            ),
          ),
          const SizedBox(height: 16),

          // طريقة الحل المنفذة
          AppTextField(
            controller: _solutionController,
            label: context.tr('solution_method_label'),
            hint: context.tr('solution_method_hint'),
            prefixIcon: Icons.task_alt_rounded,
            maxLines: 3,
          ),
          const SizedBox(height: 14),

          // ملاحظات وتوثيق التعديل
          AppTextField(
            controller: _notesController,
            label: context.tr('audit_notes_label'),
            hint: context.tr('audit_notes_hint'),
            prefixIcon: Icons.note_alt_outlined,
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildAuditTrailTab(BuildContext context) {
    final colors = context.colors;
    final audit = widget.ticket.auditTrail;

    if (audit.isEmpty) {
      return Center(
        child: AppText.caption(
          'no_audit_history',
          fontSize: 13,
          color: colors.onSurfaceVariant,
        ),
      );
    }

    return ListView.separated(
      itemCount: audit.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final entry = audit[index];
        return AppCard(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: colors.surfaceContainerHighest,
                child: Icon(Icons.history_rounded,
                    size: 16, color: colors.primary),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText.literal(
                          entry.actorName,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: colors.onSurface,
                        ),
                        AppText.literal(
                          entry.timestamp,
                          fontSize: 11,
                          color: colors.onSurfaceVariant,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    AppText.literal(
                      entry.notes.isNotEmpty ? entry.notes : entry.action,
                      fontSize: 12,
                      color: colors.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
