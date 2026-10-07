import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/enums/attendance_enums.dart';
import '../../../domain/models/attendance_filter.dart';

/// نافذة فلترة سجلات الدوام (Attendance Filter Sheet)
class AttendanceFilterSheet extends StatefulWidget {
  final AttendanceFilter initialFilter;
  final void Function(AttendanceFilter) onApply;

  const AttendanceFilterSheet({
    super.key,
    required this.initialFilter,
    required this.onApply,
  });

  static Future<void> show(
    BuildContext context, {
    required AttendanceFilter initialFilter,
    required void Function(AttendanceFilter) onApply,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          AttendanceFilterSheet(initialFilter: initialFilter, onApply: onApply),
    );
  }

  @override
  State<AttendanceFilterSheet> createState() => _AttendanceFilterSheetState();
}

class _AttendanceFilterSheetState extends State<AttendanceFilterSheet> {
  late DateTime? _startDate;
  late DateTime? _endDate;
  late AttendanceStatus? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _startDate = widget.initialFilter.fromDate;
    _endDate = widget.initialFilter.toDate;
    _selectedStatus = widget.initialFilter.status;
  }

  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      initialDateRange: (_startDate != null && _endDate != null)
          ? DateTimeRange(start: _startDate!, end: _endDate!)
          : null,
    );

    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
      });
    }
  }

  void _reset() {
    setState(() {
      _startDate = null;
      _endDate = null;
      _selectedStatus = null;
    });
  }

  void _apply() {
    final filter = widget.initialFilter.copyWith(
      fromDate: _startDate,
      toDate: _endDate,
      status: _selectedStatus,
    );

    widget.onApply(filter);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(AppDimens.paddingLarge),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadii.topXl,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ترويسة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.filter_list_rounded, color: colors.primary),
                      const SizedBox(width: AppDimens.spacingSmall),
                      AppText.titleLarge(
                        'filter_attendance_title',
                        fontWeight: FontWeight.bold,
                        fontFamily: AppAssets.fontSecondary,
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: AppDimens.spacingLarge),
              // التاريخ
              AppText(
                'filter_date_range',
                variant: AppTextVariant.labelLarge,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: AppDimens.space8),
              InkWell(
                onTap: _pickDateRange,
                borderRadius: AppRadii.md,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.paddingMedium,
                    vertical: AppDimens.paddingSmall,
                  ),
                  decoration: BoxDecoration(
                    color: colors.surfaceContainerLow,
                    borderRadius: AppRadii.md,
                    border: Border.all(color: colors.outlineVariant),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.date_range_rounded,
                            size: AppDimens.iconSm,
                            color: colors.primary,
                          ),
                          const SizedBox(width: AppDimens.spacingSmall),
                          AppText.literal(
                            (_startDate != null && _endDate != null)
                                ? '${_startDate!.year}/${_startDate!.month}/${_startDate!.day} - ${_endDate!.year}/${_endDate!.month}/${_endDate!.day}'
                                : context.tr('filter_select_date_range'),
                            variant: AppTextVariant.bodyMedium,
                            color: (_startDate != null)
                                ? colors.onSurface
                                : colors.onSurfaceVariant,
                          ),
                        ],
                      ),
                      const Icon(Icons.arrow_drop_down_rounded),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppDimens.spacingLarge),
              // حالة الدوام
              AppText(
                'filter_status_label',
                variant: AppTextVariant.labelLarge,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: AppDimens.space8),
              Wrap(
                spacing: AppDimens.space8,
                runSpacing: AppDimens.space8,
                children: [
                  _buildStatusChip(null, context.tr('all')),
                  ...AttendanceStatus.values.map(
                    (s) => _buildStatusChip(
                      s,
                      context.isArabic ? s.labelAr : s.labelEn,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimens.spacingLarge),
              // أزرار التحكم
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: context.tr('clear_filters'),
                      variant: AppButtonVariant.outlined,
                      onPressed: _reset,
                    ),
                  ),
                  const SizedBox(width: AppDimens.spacingMedium),
                  Expanded(
                    child: AppButton(
                      label: context.tr('confirm'),
                      variant: AppButtonVariant.primary,
                      onPressed: _apply,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(AttendanceStatus? status, String label) {
    final colors = context.colors;
    final isSelected = _selectedStatus == status;

    return FilterChip(
      selected: isSelected,
      label: Text(label),
      labelStyle: TextStyle(
        fontFamily: AppAssets.fontPrimary,
        fontSize: 12,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        color: isSelected ? colors.onPrimary : colors.onSurface,
      ),
      selectedColor: colors.primary,
      backgroundColor: colors.surfaceContainerLow,
      checkmarkColor: colors.onPrimary,
      onSelected: (_) {
        setState(() => _selectedStatus = status);
      },
    );
  }
}
