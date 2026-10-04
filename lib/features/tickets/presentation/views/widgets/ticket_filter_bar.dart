import 'package:flutter/material.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/app_tooltip.dart';
import '../../../domain/models/ticket_filter.dart';
import '../../../domain/models/ticket_model.dart';

/// شريط الفلترة والبحث المتقدم
class TicketFilterBar extends StatefulWidget {
  final TicketFilterModel filter;
  final List<String> problems;
  final List<String> statuses;
  final List<String> employees;
  final bool isTableView;
  final int totalCount;
  final int filteredCount;
  final ValueChanged<String> onSearch;
  final ValueChanged<TicketFilterModel> onFilterChange;
  final VoidCallback onReset;
  final ValueChanged<bool> onToggleView;
  final VoidCallback onAddTicket;

  const TicketFilterBar({
    super.key,
    required this.filter,
    required this.problems,
    required this.statuses,
    required this.employees,
    required this.isTableView,
    required this.totalCount,
    required this.filteredCount,
    required this.onSearch,
    required this.onFilterChange,
    required this.onReset,
    required this.onToggleView,
    required this.onAddTicket,
  });

  @override
  State<TicketFilterBar> createState() => _TicketFilterBarState();
}

class _TicketFilterBarState extends State<TicketFilterBar> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.filter.searchQuery);
  }

  @override
  void didUpdateWidget(covariant TicketFilterBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.filter.searchQuery != widget.filter.searchQuery &&
        _searchController.text != widget.filter.searchQuery) {
      _searchController.text = widget.filter.searchQuery;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isCompact = context.isMobile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // السطر الأول: شريط البحث، زر إضافة تذكرة، وتبديل العرض
        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: _searchController,
                label: context.tr('search'),
                hint: context.tr('search_tickets_hint'),
                prefixIcon: Icons.search_rounded,
                onChanged: widget.onSearch,
              ),
            ),
            const SizedBox(width: 8),

            // زر تبديل طريقة العرض (جدول / بطاقات)
            AppTooltip(
              message: widget.isTableView
                  ? context.tr('switch_to_cards')
                  : context.tr('switch_to_table'),
              child: IconButton.outlined(
                style: IconButton.styleFrom(
                  backgroundColor: colors.surfaceContainerLow,
                  side: BorderSide(
                    color: colors.outlineVariant.withValues(alpha: 0.3),
                  ),
                ),
                icon: Icon(
                  widget.isTableView ? Icons.grid_view_rounded : Icons.table_chart_rounded,
                  color: colors.primary,
                ),
                onPressed: () => widget.onToggleView(!widget.isTableView),
              ),
            ),
            const SizedBox(width: 8),

            // زر إضافة تذكرة جديدة
            AppButton(
              label: isCompact ? '' : context.tr('add_ticket_btn'),
              icon: Icons.add_rounded,
              onPressed: widget.onAddTicket,
            ),
          ],
        ),
        const SizedBox(height: 12),

        // السطر الثاني: الفلاتر المنسدلة، العداد، وزر مسح الفلاتر
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // فلتر الحالة
              _buildFilterDropdown<TicketStatus>(
                context: context,
                label: context.tr('col_status'),
                value: widget.filter.status,
                items: TicketStatus.values,
                itemLabel: (s) => context.isArabic ? s.labelAr : s.labelEn,
                onSelected: (val) {
                  widget.onFilterChange(widget.filter.copyWith(status: () => val));
                },
              ),
              const SizedBox(width: 8),

              // فلتر نوع المشكلة
              _buildFilterDropdown<String>(
                context: context,
                label: context.tr('col_problem'),
                value: widget.filter.problemType,
                items: widget.problems,
                itemLabel: (p) => p,
                onSelected: (val) {
                  widget.onFilterChange(widget.filter.copyWith(problemType: () => val));
                },
              ),
              const SizedBox(width: 8),

              // فلتر الموظف
              _buildFilterDropdown<String>(
                context: context,
                label: context.tr('col_employee'),
                value: widget.filter.assignedEmployee,
                items: widget.employees,
                itemLabel: (e) => e,
                onSelected: (val) {
                  widget.onFilterChange(widget.filter.copyWith(assignedEmployee: () => val));
                },
              ),
              const SizedBox(width: 8),

              // زر مسح الفلاتر
              if (widget.filter.hasActiveFilters) ...[
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: colors.error,
                  ),
                  icon: const Icon(Icons.clear_all_rounded, size: 18),
                  label: Text(
                    context.tr('clear_filters'),
                    style: const TextStyle(
                      fontFamily: AppAssets.fontPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    _searchController.clear();
                    widget.onReset();
                  },
                ),
                const SizedBox(width: 8),
              ],

              // عداد النتائج
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: colors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '${context.tr('showing')}: ${widget.filteredCount} / ${widget.totalCount}',
                  style: TextStyle(
                    fontFamily: AppAssets.fontPrimary,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterDropdown<T>({
    required BuildContext context,
    required String label,
    required T? value,
    required List<T> items,
    required String Function(T) itemLabel,
    required ValueChanged<T?> onSelected,
  }) {
    final colors = context.colors;
    final isSelected = value != null;

    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected
            ? colors.primaryContainer.withValues(alpha: 0.25)
            : colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected
              ? colors.primary
              : colors.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T?>(
          value: value,
          isDense: true,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 18,
            color: isSelected ? colors.primary : colors.onSurfaceVariant,
          ),
          hint: Text(
            label,
            style: TextStyle(
              fontFamily: AppAssets.fontPrimary,
              fontSize: 12,
              color: isSelected ? colors.primary : colors.onSurfaceVariant,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          items: [
            DropdownMenuItem<T?>(
              value: null,
              child: Text(
                '${context.tr('all')} $label',
                style: TextStyle(
                  fontFamily: AppAssets.fontPrimary,
                  fontSize: 12,
                  color: colors.onSurface,
                ),
              ),
            ),
            ...items.map(
              (item) => DropdownMenuItem<T?>(
                value: item,
                child: Text(
                  itemLabel(item),
                  style: TextStyle(
                    fontFamily: AppAssets.fontPrimary,
                    fontSize: 12,
                    color: colors.onSurface,
                  ),
                ),
              ),
            ),
          ],
          onChanged: onSelected,
        ),
      ),
    );
  }
}
