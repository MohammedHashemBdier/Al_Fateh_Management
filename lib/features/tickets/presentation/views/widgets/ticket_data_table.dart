import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/models/ticket_filter.dart';
import '../../../domain/models/ticket_model.dart';

/// خيارات كثافة وارتفاع الصفوف في جدول المتابعات
enum TableRowDensity {
  compact(40.0, 46.0, 'مدمج (صغير)', 'Compact'),
  regular(52.0, 58.0, 'عادي (متوسط)', 'Regular'),
  spacious(68.0, 76.0, 'مريح (كبير)', 'Spacious');

  final double minHeight;
  final double maxHeight;
  final String labelAr;
  final String labelEn;
  const TableRowDensity(
      this.minHeight, this.maxHeight, this.labelAr, this.labelEn);
}

/// جدول البيانات المتقدم للتذاكر على شاشات الديسكتوب والتابلت مع دعم السكرول الرأسي والأفقي
class TicketDataTable extends StatefulWidget {
  final List<TicketModel> tickets;
  final Set<int> selectedIds;
  final String searchQuery;
  final TicketSortField sortField;
  final SortDirection sortDirection;
  final ValueChanged<TicketSortField> onSort;
  final ValueChanged<int> onToggleSelect;
  final ValueChanged<bool> onSelectAll;
  final ValueChanged<TicketModel> onTicketTap;
  final ValueChanged<TicketModel> onEditTap;

  const TicketDataTable({
    super.key,
    required this.tickets,
    required this.selectedIds,
    required this.searchQuery,
    required this.sortField,
    required this.sortDirection,
    required this.onSort,
    required this.onToggleSelect,
    required this.onSelectAll,
    required this.onTicketTap,
    required this.onEditTap,
  });

  @override
  State<TicketDataTable> createState() => _TicketDataTableState();
}

class _TicketDataTableState extends State<TicketDataTable> {
  final ScrollController _verticalScrollController = ScrollController();
  final ScrollController _horizontalScrollController = ScrollController();
  TableRowDensity _density = TableRowDensity.regular;

  @override
  void dispose() {
    _verticalScrollController.dispose();
    _horizontalScrollController.dispose();
    super.dispose();
  }

  void _scrollHorizontally(double delta) {
    if (!_horizontalScrollController.hasClients) return;
    final target = (_horizontalScrollController.offset + delta).clamp(
      0.0,
      _horizontalScrollController.position.maxScrollExtent,
    );
    _horizontalScrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final allSelected = widget.tickets.isNotEmpty &&
        widget.tickets.every((t) => widget.selectedIds.contains(t.rowId));

    return AppCard(
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.trackpad,
                  PointerDeviceKind.stylus,
                },
                scrollbars: false,
              ),
              child: Scrollbar(
                controller: _horizontalScrollController,
                thumbVisibility: true,
                trackVisibility: true,
                interactive: true,
                thickness: 9.0,
                radius: const Radius.circular(4.5),
                notificationPredicate: (notif) =>
                    notif.metrics.axis == Axis.horizontal,
                child: Scrollbar(
                  controller: _verticalScrollController,
                  thumbVisibility: true,
                  trackVisibility: true,
                  interactive: true,
                  thickness: 9.0,
                  radius: const Radius.circular(4.5),
                  notificationPredicate: (notif) =>
                      notif.metrics.axis == Axis.vertical,
                  child: SingleChildScrollView(
                    controller: _verticalScrollController,
                    scrollDirection: Axis.vertical,
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SingleChildScrollView(
                      controller: _horizontalScrollController,
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: constraints.maxWidth),
                        child: DataTable(
                      showCheckboxColumn: false,
                      headingRowHeight: 48,
                      dataRowMinHeight: _density.minHeight,
                      dataRowMaxHeight: _density.maxHeight,
                      horizontalMargin: 16,
                      columnSpacing: 24,
                      headingRowColor: WidgetStateProperty.all(
                        colors.surfaceContainerHighest.withValues(alpha: 0.6),
                      ),
                      columns: [
                        DataColumn(
                          label: Checkbox(
                            value: allSelected,
                            onChanged: (val) =>
                                widget.onSelectAll(val ?? false),
                          ),
                        ),
                        DataColumn(
                          label: _buildSortableHeader(
                            context,
                            label: context.tr('col_ticket_id'),
                            field: TicketSortField.rowId,
                          ),
                        ),
                        DataColumn(
                          label: _buildSortableHeader(
                            context,
                            label: context.tr('col_subscriber'),
                            field: TicketSortField.subscriberName,
                          ),
                        ),
                        DataColumn(
                          label: _buildSortableHeader(
                            context,
                            label: context.tr('col_landline'),
                            field: TicketSortField.landline,
                          ),
                        ),
                        DataColumn(
                          label: AppText.literal(
                            context.tr('col_problem'),
                            style: _headerStyle(colors),
                          ),
                        ),
                        DataColumn(
                          label: _buildSortableHeader(
                            context,
                            label: context.tr('col_status'),
                            field: TicketSortField.status,
                          ),
                        ),
                        DataColumn(
                          label: _buildSortableHeader(
                            context,
                            label: context.tr('col_employee'),
                            field: TicketSortField.employee,
                          ),
                        ),
                        DataColumn(
                          label: _buildSortableHeader(
                            context,
                            label: context.tr('col_date_time'),
                            field: TicketSortField.date,
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppText.literal(
                                context.tr('actions'),
                                style: _headerStyle(colors),
                              ),
                              const SizedBox(width: 4),
                              PopupMenuButton<TableRowDensity>(
                                tooltip: context.isArabic
                                    ? 'حجم وارتفاع الصفوف'
                                    : 'Row Density',
                                icon: Icon(
                                  Icons.format_line_spacing_rounded,
                                  size: 16,
                                  color: colors.onSurfaceVariant,
                                ),
                                initialValue: _density,
                                onSelected: (d) =>
                                    setState(() => _density = d),
                                itemBuilder: (ctx) =>
                                    TableRowDensity.values.map((d) {
                                  return PopupMenuItem<TableRowDensity>(
                                    value: d,
                                    child: Row(
                                      children: [
                                        Icon(
                                          d == _density
                                              ? Icons.radio_button_checked
                                              : Icons.radio_button_off,
                                          size: 16,
                                          color: d == _density
                                              ? colors.primary
                                              : colors.onSurfaceVariant,
                                        ),
                                        const SizedBox(width: 8),
                                        AppText.literal(
                                          context.isArabic
                                              ? d.labelAr
                                              : d.labelEn,
                                          fontSize: 12,
                                          fontWeight: d == _density
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(width: 4),
                              AppTooltip(
                                message: context.isArabic
                                    ? 'تمرير لليمين'
                                    : 'Scroll right',
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(4),
                                  onTap: () => _scrollHorizontally(-260),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.chevron_right_rounded,
                                      size: 18,
                                      color: colors.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                              ),
                              AppTooltip(
                                message: context.isArabic
                                    ? 'تمرير لليسار'
                                    : 'Scroll left',
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(4),
                                  onTap: () => _scrollHorizontally(260),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.chevron_left_rounded,
                                      size: 18,
                                      color: colors.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      rows: widget.tickets.map((ticket) {
                        final isSelected =
                            widget.selectedIds.contains(ticket.rowId);
                        return DataRow(
                          selected: isSelected,
                          onSelectChanged: (_) =>
                              widget.onToggleSelect(ticket.rowId),
                          color: WidgetStateProperty.resolveWith<Color?>(
                              (states) {
                            if (states.contains(WidgetState.hovered)) {
                              return colors.primary.withValues(alpha: 0.05);
                            }
                            if (isSelected) {
                              return colors.primaryContainer
                                  .withValues(alpha: 0.2);
                            }
                            return null;
                          }),
                          cells: [
                            DataCell(
                              Checkbox(
                                value: isSelected,
                                onChanged: (_) =>
                                    widget.onToggleSelect(ticket.rowId),
                              ),
                            ),
                            DataCell(
                              InkWell(
                                onTap: () => widget.onTicketTap(ticket),
                                borderRadius: BorderRadius.circular(4),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AppText.literal(
                                        '#${ticket.rowId > 0 ? ticket.rowId : 'OFFLINE'}',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: colors.primary,
                                      ),
                                      if (ticket.syncState !=
                                          SyncState.synced) ...[
                                        const SizedBox(width: 4),
                                        Icon(
                                          Icons.cloud_upload_outlined,
                                          size: 14,
                                          color: colors.warning,
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              _buildHighlightedText(
                                text: ticket.subscriberName,
                                query: widget.searchQuery,
                                textColor: colors.onSurface,
                                highlightColor: colors.primaryContainer,
                                isBold: true,
                              ),
                            ),
                            DataCell(
                              _buildHighlightedText(
                                text: ticket.landline,
                                query: widget.searchQuery,
                                textColor: colors.onSurfaceVariant,
                                highlightColor: colors.primaryContainer,
                                isBold: false,
                              ),
                            ),
                            DataCell(
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 180),
                                child: AppText.literal(
                                  ticket.problem,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13,
                                  color: colors.onSurface,
                                ),
                              ),
                            ),
                            DataCell(
                              AppStatusBadge(status: ticket.status),
                            ),
                            DataCell(
                              AppText.literal(
                                ticket.employee.isNotEmpty
                                    ? ticket.employee
                                    : context.tr('unassigned'),
                                fontSize: 13,
                                color: colors.onSurfaceVariant,
                              ),
                            ),
                            DataCell(
                              AppText.literal(
                                '${ticket.date} ${ticket.time}',
                                fontSize: 12,
                                color: colors.onSurfaceVariant
                                    .withValues(alpha: 0.8),
                              ),
                            ),
                            DataCell(
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppTooltip(
                                    message: context.tr('view_details'),
                                    child: IconButton(
                                      icon: const Icon(
                                          Icons.visibility_outlined,
                                          size: 18),
                                      color: colors.onSurfaceVariant,
                                      onPressed: () =>
                                          widget.onTicketTap(ticket),
                                    ),
                                  ),
                                  AppTooltip(
                                    message: context.tr('edit_ticket'),
                                    child: IconButton(
                                      icon: const Icon(Icons.edit_outlined,
                                          size: 18),
                                      color: colors.primary,
                                      onPressed: () =>
                                          widget.onEditTap(ticket),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      ),
    ),
  );
}

  Widget _buildSortableHeader(
    BuildContext context, {
    required String label,
    required TicketSortField field,
  }) {
    final colors = context.colors;
    final isCurrent = widget.sortField == field;

    return InkWell(
      onTap: () => widget.onSort(field),
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText.literal(label, style: _headerStyle(colors)),
            const SizedBox(width: 4),
            Icon(
              isCurrent
                  ? (widget.sortDirection == SortDirection.ascending
                      ? Icons.arrow_upward_rounded
                      : Icons.arrow_downward_rounded)
                  : Icons.unfold_more_rounded,
              size: 16,
              color: isCurrent
                  ? colors.primary
                  : colors.onSurfaceVariant.withValues(alpha: 0.4),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _headerStyle(ColorScheme colors) => TextStyle(
        fontFamily: AppAssets.fontPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 13,
        color: colors.onSurface,
      );

  Widget _buildHighlightedText({
    required String text,
    required String query,
    required Color textColor,
    required Color highlightColor,
    required bool isBold,
  }) {
    if (query.trim().isEmpty || !text.toLowerCase().contains(query.toLowerCase())) {
      return AppText.literal(
        text,
        fontSize: 13,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: textColor,
      );
    }

    final lowerText = text.toLowerCase();
    final lowerQuery = query.toLowerCase();
    final startIndex = lowerText.indexOf(lowerQuery);
    final endIndex = startIndex + query.length;

    final before = text.substring(0, startIndex);
    final match = text.substring(startIndex, endIndex);
    final after = text.substring(endIndex);

    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: AppAssets.fontPrimary,
          fontSize: 13,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: textColor,
        ),
        children: [
          TextSpan(text: before),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
              decoration: BoxDecoration(
                color: highlightColor,
                borderRadius: BorderRadius.circular(3),
              ),
              child: AppText.literal(
                match,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
          TextSpan(text: after),
        ],
      ),
    );
  }
}
