import 'package:flutter/material.dart';

import '../utils/context_extensions.dart';

class AppCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final bool enableHover;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(18.0),
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 16.0,
    this.enableHover = true,
  });

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isDark = context.isDark;

    final defaultBg =
        widget.backgroundColor ??
        (isDark
            ? colors.surfaceContainerHighest.withValues(alpha: 0.35)
            : colors.surface);

    final defaultBorder =
        widget.borderColor ??
        colors.outlineVariant.withValues(alpha: _isHovered ? 0.6 : 0.3);

    return MouseRegion(
      onEnter: widget.enableHover
          ? (_) => setState(() => _isHovered = true)
          : null,
      onExit: widget.enableHover
          ? (_) => setState(() => _isHovered = false)
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(
          0.0,
          _isHovered && widget.onTap != null ? -2.0 : 0.0,
          0.0,
        ),
        decoration: BoxDecoration(
          color: defaultBg,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(color: defaultBorder),
          boxShadow: _isHovered && widget.onTap != null
              ? [
                  BoxShadow(
                    color: colors.shadow.withValues(
                      alpha: isDark ? 0.25 : 0.08,
                    ),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: Padding(padding: widget.padding, child: widget.child),
          ),
        ),
      ),
    );
  }
}
