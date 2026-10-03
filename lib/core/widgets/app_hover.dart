import 'package:flutter/material.dart';

/// ويدجت مخصص لتطبيق تأثيرات التفاعل عند تمرير الفأرة (Hover Effects)
/// مصمم خصيصاً لأنظمة التشغيل المكتبية (Windows / macOS / Linux) ومتصفحات الويب
class AppHover extends StatefulWidget {
  final Widget child;
  final Widget Function(BuildContext context, bool isHovered)? builder;
  final Duration duration;
  final double scale;
  final Offset translate;
  final MouseCursor cursor;
  final VoidCallback? onTap;

  const AppHover({
    super.key,
    required this.child,
    this.builder,
    this.duration = const Duration(milliseconds: 200),
    this.scale = 1.0,
    this.translate = Offset.zero,
    this.cursor = SystemMouseCursors.click,
    this.onTap,
  });

  /// باني سريع مع تكبير طفيف ونقل عمودي للأزرار والبطاقات
  factory AppHover.scale({
    Key? key,
    required Widget child,
    double scale = 1.02,
    VoidCallback? onTap,
  }) {
    return AppHover(
      key: key,
      scale: scale,
      onTap: onTap,
      child: child,
    );
  }

  /// باني سريع مع رفع خفيف (Floating effect)
  factory AppHover.float({
    Key? key,
    required Widget child,
    double dy = -3.0,
    VoidCallback? onTap,
  }) {
    return AppHover(
      key: key,
      translate: Offset(0, dy),
      onTap: onTap,
      child: child,
    );
  }

  @override
  State<AppHover> createState() => _AppHoverState();
}

class _AppHoverState extends State<AppHover> {
  bool _isHovered = false;

  void _onEnter(PointerEvent details) {
    if (!_isHovered) {
      setState(() => _isHovered = true);
    }
  }

  void _onExit(PointerEvent details) {
    if (_isHovered) {
      setState(() => _isHovered = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveChild = widget.builder != null
        ? widget.builder!(context, _isHovered)
        : widget.child;

    return MouseRegion(
      cursor: widget.cursor,
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? widget.scale : 1.0,
          duration: widget.duration,
          curve: Curves.easeOutCubic,
          child: AnimatedSlide(
            offset: _isHovered ? widget.translate : Offset.zero,
            duration: widget.duration,
            curve: Curves.easeOutCubic,
            child: effectiveChild,
          ),
        ),
      ),
    );
  }
}
