import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import '../utils/context_extensions.dart';

class AppDivider extends StatelessWidget {
  final String? label;
  final double height;

  const AppDivider({super.key, this.label, this.height = 24.0});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    if (label == null) {
      return Divider(
        height: height,
        color: colors.outlineVariant.withValues(alpha: 0.3),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height / 4),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: colors.outlineVariant.withValues(alpha: 0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              label!,
              style: TextStyle(
                fontFamily: AppAssets.fontPrimary,
                fontSize: 12,
                color: colors.onSurfaceVariant.withValues(alpha: 0.7),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: colors.outlineVariant.withValues(alpha: 0.3),
            ),
          ),
        ],
      ),
    );
  }
}
