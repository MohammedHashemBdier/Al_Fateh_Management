import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';

enum CheckInButtonMode { checkIn, checkOut }

/// زر تسجيل الحضور والانصراف التفاعلي الكبير والمصمم خصيصاً للشاشات الحيوية
class CheckInButton extends StatelessWidget {
  final CheckInButtonMode mode;
  final bool isLoading;
  final bool isEnabled;
  final String? disabledReason;
  final VoidCallback? onPressed;

  const CheckInButton({
    super.key,
    required this.mode,
    this.isLoading = false,
    this.isEnabled = true,
    this.disabledReason,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isCheckIn = mode == CheckInButtonMode.checkIn;

    final primaryColor = isCheckIn ? colors.success : colors.primary;
    final onPrimaryColor = isCheckIn ? colors.onSuccess : colors.onPrimary;
    final title = isCheckIn ? 'action_check_in' : 'action_check_out';
    final icon = isCheckIn ? Icons.fingerprint_rounded : Icons.logout_rounded;

    Widget buttonContent = AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 64,
      decoration: BoxDecoration(
        color: isEnabled ? primaryColor : colors.surfaceContainerHighest,
        borderRadius: AppRadii.lg,
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: primaryColor.withValues(alpha: 0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: AppRadii.lg,
        child: InkWell(
          onTap: (isEnabled && !isLoading) ? onPressed : null,
          borderRadius: AppRadii.lg,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.paddingLarge,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading) ...[
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(onPrimaryColor),
                    ),
                  ),
                  const SizedBox(width: AppDimens.spacingMedium),
                ] else ...[
                  Icon(
                    icon,
                    size: AppDimens.iconLg,
                    color: isEnabled ? onPrimaryColor : colors.onSurfaceVariant,
                  ),
                  const SizedBox(width: AppDimens.spacingMedium),
                ],
                AppText.titleLarge(
                  title,
                  fontFamily: AppAssets.fontSecondary,
                  fontWeight: FontWeight.bold,
                  color: isEnabled ? onPrimaryColor : colors.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (!isEnabled && disabledReason != null && disabledReason!.isNotEmpty) {
      return AppTooltip(message: disabledReason!, child: buttonContent);
    }

    return buttonContent;
  }
}
