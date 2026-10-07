import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';

/// نافذة تقديم طلب تصحيح دوام (Correction Request Dialog)
class CorrectionRequestDialog extends StatefulWidget {
  final String attendanceId;
  final String initialDate;
  final String? initialCheckIn;
  final String? initialCheckOut;
  final void Function({
    required String attendanceId,
    required String targetDate,
    required String? checkIn,
    required String? checkOut,
    required String reason,
  })
  onSubmit;

  const CorrectionRequestDialog({
    super.key,
    required this.attendanceId,
    required this.initialDate,
    this.initialCheckIn,
    this.initialCheckOut,
    required this.onSubmit,
  });

  static Future<void> show(
    BuildContext context, {
    required String attendanceId,
    required String initialDate,
    String? initialCheckIn,
    String? initialCheckOut,
    required void Function({
      required String attendanceId,
      required String targetDate,
      required String? checkIn,
      required String? checkOut,
      required String reason,
    })
    onSubmit,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CorrectionRequestDialog(
        attendanceId: attendanceId,
        initialDate: initialDate,
        initialCheckIn: initialCheckIn,
        initialCheckOut: initialCheckOut,
        onSubmit: onSubmit,
      ),
    );
  }

  @override
  State<CorrectionRequestDialog> createState() =>
      _CorrectionRequestDialogState();
}

class _CorrectionRequestDialogState extends State<CorrectionRequestDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _checkInController;
  late final TextEditingController _checkOutController;
  late final TextEditingController _reasonController;

  @override
  void initState() {
    super.initState();
    _checkInController = TextEditingController(
      text: widget.initialCheckIn ?? '08:00',
    );
    _checkOutController = TextEditingController(
      text: widget.initialCheckOut ?? '16:00',
    );
    _reasonController = TextEditingController();
  }

  @override
  void dispose() {
    _checkInController.dispose();
    _checkOutController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  Future<void> _pickTime(TextEditingController controller) async {
    final parts = controller.text.split(':');
    final initialHour = parts.isNotEmpty ? int.tryParse(parts[0]) ?? 8 : 8;
    final initialMinute = parts.length > 1 ? int.tryParse(parts[1]) ?? 0 : 0;

    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: initialHour, minute: initialMinute),
    );

    if (picked != null) {
      final hourStr = picked.hour.toString().padLeft(2, '0');
      final minStr = picked.minute.toString().padLeft(2, '0');
      controller.text = '$hourStr:$minStr';
    }
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onSubmit(
        attendanceId: widget.attendanceId,
        targetDate: widget.initialDate,
        checkIn: _checkInController.text.trim().isNotEmpty
            ? _checkInController.text.trim()
            : null,
        checkOut: _checkOutController.text.trim().isNotEmpty
            ? _checkOutController.text.trim()
            : null,
        reason: _reasonController.text.trim(),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: AppRadii.lg),
      backgroundColor: colors.surface,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.paddingLarge),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.edit_calendar_rounded,
                          color: colors.primary,
                          size: AppDimens.iconLg,
                        ),
                        const SizedBox(width: AppDimens.spacingSmall),
                        AppText.titleLarge(
                          'dialog_correction_title',
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
                const SizedBox(height: AppDimens.spacingSmall),
                AppText.literal(
                  '${context.tr('target_date')}: ${widget.initialDate}',
                  variant: AppTextVariant.caption,
                  color: colors.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: AppDimens.spacingLarge),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        label: context.tr('corrected_check_in'),
                        controller: _checkInController,
                        readOnly: true,
                        prefixIcon: Icons.login_rounded,
                        onTap: () => _pickTime(_checkInController),
                      ),
                    ),
                    const SizedBox(width: AppDimens.spacingMedium),
                    Expanded(
                      child: AppTextField(
                        label: context.tr('corrected_check_out'),
                        controller: _checkOutController,
                        readOnly: true,
                        prefixIcon: Icons.logout_rounded,
                        onTap: () => _pickTime(_checkOutController),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimens.spacingMedium),
                AppTextField(
                  label: context.tr('correction_reason_label'),
                  hint: context.tr('correction_reason_hint'),
                  controller: _reasonController,
                  maxLines: 3,
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return context.tr('correction_reason_required');
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppDimens.spacingLarge),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButton(
                      label: context.tr('cancel'),
                      variant: AppButtonVariant.outlined,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(width: AppDimens.spacingMedium),
                    AppButton(
                      label: context.tr('submit_request'),
                      variant: AppButtonVariant.primary,
                      onPressed: _submit,
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
}
