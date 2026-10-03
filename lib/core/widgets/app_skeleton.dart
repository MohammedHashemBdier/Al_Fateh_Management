import 'package:flutter/material.dart';
import '../utils/context_extensions.dart';

/// ويدجت التحميل الهيكلي النابض (Skeleton Shimmer Loader)
/// يوفر تجربة بصرية فائقة السلاسة أثناء جلب البيانات أو تسجيل الدخول
class AppSkeleton extends StatefulWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxShape shape;
  final EdgeInsetsGeometry? margin;

  const AppSkeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 8.0,
    this.shape = BoxShape.rectangle,
    this.margin,
  });

  /// قالب هيكلي دائري (للصور الرمزية والأيقونات)
  const AppSkeleton.circle({
    super.key,
    required double size,
    this.margin,
  })  : width = size,
        height = size,
        borderRadius = 0,
        shape = BoxShape.circle;

  /// قالب هيكلي لحقول الإدخال
  const AppSkeleton.input({
    super.key,
    this.width = double.infinity,
    this.height = 48.0,
    this.borderRadius = 12.0,
    this.margin,
  }) : shape = BoxShape.rectangle;

  /// قالب هيكلي للأزرار
  const AppSkeleton.button({
    super.key,
    this.width = double.infinity,
    this.height = 46.0,
    this.borderRadius = 12.0,
    this.margin,
  }) : shape = BoxShape.rectangle;

  /// قالب هيكلي لأسطر النصوص
  const AppSkeleton.text({
    super.key,
    this.width = 140.0,
    this.height = 16.0,
    this.borderRadius = 4.0,
    this.margin,
  }) : shape = BoxShape.rectangle;

  @override
  State<AppSkeleton> createState() => _AppSkeletonState();
}

class _AppSkeletonState extends State<AppSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();

    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;

    // ألوان نابضة متناسقة مع الثيم
    final baseColor = isDark
        ? const Color(0xff1b263b).withValues(alpha: 0.6)
        : const Color(0xffe2e8f0);

    final highlightColor = isDark
        ? const Color(0xff2d3d59).withValues(alpha: 0.8)
        : const Color(0xfff8fafc);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          decoration: BoxDecoration(
            shape: widget.shape,
            borderRadius: widget.shape == BoxShape.rectangle
                ? BorderRadius.circular(widget.borderRadius)
                : null,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                (_animation.value - 0.3).clamp(0.0, 1.0),
                _animation.value.clamp(0.0, 1.0),
                (_animation.value + 0.3).clamp(0.0, 1.0),
              ],
              colors: [
                baseColor,
                highlightColor,
                baseColor,
              ],
            ),
          ),
        );
      },
    );
  }
}
