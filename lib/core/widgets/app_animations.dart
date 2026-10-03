import 'package:flutter/material.dart';

/// ويدجيت أنيميشن الدخول الانسيابي (Fade + Slide + Scale) مع دعم التأخير الزمني (Staggered Animations)
class AppFadeSlide extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset offset;
  final Curve curve;
  final bool fadeIn;
  final bool scaleIn;
  final double initialScale;

  const AppFadeSlide({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 400),
    this.offset = const Offset(0.0, 0.08),
    this.curve = Curves.easeOutCubic,
    this.fadeIn = true,
    this.scaleIn = false,
    this.initialScale = 0.95,
  });

  @override
  State<AppFadeSlide> createState() => _AppFadeSlideState();
}

class _AppFadeSlideState extends State<AppFadeSlide>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;
  bool _disposed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    final curved = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    _fadeAnimation = Tween<double>(
      begin: widget.fadeIn ? 0.0 : 1.0,
      end: 1.0,
    ).animate(curved);

    _slideAnimation = Tween<Offset>(
      begin: widget.offset,
      end: Offset.zero,
    ).animate(curved);

    _scaleAnimation = Tween<double>(
      begin: widget.scaleIn ? widget.initialScale : 1.0,
      end: 1.0,
    ).animate(curved);

    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (!_disposed && mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        Widget result = child!;
        if (widget.scaleIn) {
          result = Transform.scale(
            scale: _scaleAnimation.value,
            child: result,
          );
        }
        if (widget.offset != Offset.zero) {
          result = FractionalTranslation(
            translation: _slideAnimation.value,
            child: result,
          );
        }
        if (widget.fadeIn) {
          result = Opacity(
            opacity: _fadeAnimation.value.clamp(0.0, 1.0),
            child: result,
          );
        }
        return result;
      },
      child: widget.child,
    );
  }
}

/// ويدجيت التبديل الحركي الانسيابي بين الحالات (مثل الانتقال بين Skeleton والمحتوى الفعلي)
class AppAnimatedSwitch extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Duration reverseDuration;

  const AppAnimatedSwitch({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      reverseDuration: reverseDuration,
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: child,
    );
  }
}
