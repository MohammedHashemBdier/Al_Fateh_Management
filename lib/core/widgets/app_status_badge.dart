import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import '../utils/context_extensions.dart';

class AppStatusBadge extends StatelessWidget {
  final String status;
  final bool showDot;

  const AppStatusBadge({
    super.key,
    required this.status,
    this.showDot = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = _getStatusColors(context, status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: colors.bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDot) ...[
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: colors.textColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
          ],
          Text(
            status,
            style: TextStyle(
              fontFamily: AppAssets.fontPrimary,
              color: colors.textColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  _StatusColors _getStatusColors(BuildContext context, String status) {
    final cleanStatus = status.trim();
    final themeColors = context.colors;

    if (cleanStatus.contains('تم الحل') ||
        cleanStatus.contains('نشط') ||
        cleanStatus.toLowerCase().contains('resolved') ||
        cleanStatus.toLowerCase().contains('active')) {
      final base = themeColors.success;
      return _StatusColors(
        textColor: base,
        bgColor: base.withValues(alpha: 0.12),
        borderColor: base.withValues(alpha: 0.35),
      );
    } else if (cleanStatus.contains('قيد الحل') ||
        cleanStatus.contains('متابعة') ||
        cleanStatus.toLowerCase().contains('progress') ||
        cleanStatus.toLowerCase().contains('pending')) {
      final base = themeColors.warning;
      return _StatusColors(
        textColor: base,
        bgColor: base.withValues(alpha: 0.12),
        borderColor: base.withValues(alpha: 0.35),
      );
    } else if (cleanStatus.contains('لم يتم') ||
        cleanStatus.contains('معلق') ||
        cleanStatus.toLowerCase().contains('unresolved') ||
        cleanStatus.toLowerCase().contains('failed')) {
      final base = themeColors.error;
      return _StatusColors(
        textColor: base,
        bgColor: base.withValues(alpha: 0.12),
        borderColor: base.withValues(alpha: 0.35),
      );
    } else {
      final base = themeColors.info;
      return _StatusColors(
        textColor: base,
        bgColor: base.withValues(alpha: 0.12),
        borderColor: base.withValues(alpha: 0.35),
      );
    }
  }
}

class _StatusColors {
  final Color textColor;
  final Color bgColor;
  final Color borderColor;

  const _StatusColors({
    required this.textColor,
    required this.bgColor,
    required this.borderColor,
  });
}
