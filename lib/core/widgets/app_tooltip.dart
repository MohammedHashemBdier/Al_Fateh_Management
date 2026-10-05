import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../utils/context_extensions.dart';

/// ويدجت تلميح توضيحي مخصص وذكي (Custom Adaptive Tooltip)
class AppTooltip extends StatelessWidget {
  final String message;
  final Widget child;
  final AxisDirection direction;
  final Duration waitDuration;

  const AppTooltip({
    super.key,
    required this.message,
    required this.child,
    this.direction = AxisDirection.up,
    this.waitDuration = const Duration(milliseconds: 400),
  });

  @override
  Widget build(BuildContext context) {
    if (message.isEmpty) return child;

    final colors = context.colors;

    return Tooltip(
      message: message,
      waitDuration: waitDuration,
      showDuration: const Duration(seconds: 3),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colors.inverseSurface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withValues(alpha: 0.18),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      textStyle: TextStyle(
        fontFamily: AppAssets.fontPrimary,
        color: colors.onInverseSurface,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      child: child,
    );
  }
}
