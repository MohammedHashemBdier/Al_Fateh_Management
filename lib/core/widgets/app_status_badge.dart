import 'package:flutter/material.dart';
import '../constants/app_assets.dart';

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
    final colors = _getStatusColors(status);

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

  _StatusColors _getStatusColors(String status) {
    final cleanStatus = status.trim();

    if (cleanStatus.contains('تم الحل') ||
        cleanStatus.contains('نشط') ||
        cleanStatus.toLowerCase().contains('resolved') ||
        cleanStatus.toLowerCase().contains('active')) {
      return const _StatusColors(
        textColor: Color(0xff2e7d32),
        bgColor: Color(0x1a2e7d32),
        borderColor: Color(0x4d2e7d32),
      );
    } else if (cleanStatus.contains('قيد الحل') ||
        cleanStatus.contains('متابعة') ||
        cleanStatus.toLowerCase().contains('progress') ||
        cleanStatus.toLowerCase().contains('pending')) {
      return const _StatusColors(
        textColor: Color(0xffe65100),
        bgColor: Color(0x1ae65100),
        borderColor: Color(0x4de65100),
      );
    } else if (cleanStatus.contains('لم يتم') ||
        cleanStatus.contains('معلق') ||
        cleanStatus.toLowerCase().contains('unresolved') ||
        cleanStatus.toLowerCase().contains('failed')) {
      return const _StatusColors(
        textColor: Color(0xffc62828),
        bgColor: Color(0x1ac62828),
        borderColor: Color(0x4dc62828),
      );
    } else {
      return const _StatusColors(
        textColor: Color(0xff0277bd),
        bgColor: Color(0x1a0277bd),
        borderColor: Color(0x4d0277bd),
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
