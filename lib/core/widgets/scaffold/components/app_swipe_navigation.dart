import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../features/auth/domain/models/user_model.dart';
import '../../../services/services.dart';
import '../models/role_definitions.dart';

/// مكوّن التمرير الأفقي الذكي للتنقل بين الصفحات والأبواب (Swipe Navigation Controller)
/// يتيح التمرير السلس (Swipe Gestures) يميناً ويساراً للتنقل بين التبويبات المصرح بها للمستخدم
class AppSwipeNavigation extends StatefulWidget {
  final Widget child;
  final String activeRoute;
  final UserModel? user;
  final bool enabled;
  final ValueChanged<String>? onNavigate;
  final double velocityThreshold;
  final double distanceThreshold;

  const AppSwipeNavigation({
    super.key,
    required this.child,
    required this.activeRoute,
    this.user,
    this.enabled = true,
    this.onNavigate,
    this.velocityThreshold = 280.0,
    this.distanceThreshold = 75.0,
  });

  @override
  State<AppSwipeNavigation> createState() => _AppSwipeNavigationState();
}

class _AppSwipeNavigationState extends State<AppSwipeNavigation> {
  double _horizontalDragDistance = 0.0;
  bool _isNavigating = false;
  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onDragStart(DragStartDetails details) {
    _horizontalDragDistance = 0.0;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (!widget.enabled || _isNavigating) return;
    _horizontalDragDistance += details.primaryDelta ?? 0.0;
  }

  void _onDragEnd(DragEndDetails details) {
    if (!widget.enabled || _isNavigating) return;

    final velocity = details.primaryVelocity ?? 0.0;
    final distance = _horizontalDragDistance;
    _horizontalDragDistance = 0.0;

    // فحص شروط التمرير: إما سرعة قوية (Fling) أو مسافة كافية
    final isVelocityFling = velocity.abs() >= widget.velocityThreshold;
    final isDistanceDrag = distance.abs() >= widget.distanceThreshold;

    if (!isVelocityFling && !isDistanceDrag) return;

    // تحديد الاتجاه (سالب = لليسار، موجب = لليمين)
    final isSwipeLeft = isVelocityFling ? velocity < 0 : distance < 0;

    String? targetRoute;
    if (isSwipeLeft) {
      // تمرير نحو اليسار -> الانتقال إلى التبويب التالي
      targetRoute = RoleDefinitions.getNextRoute(
        widget.activeRoute,
        widget.user?.roleId,
      );
    } else {
      // تمرير نحو اليمين -> الانتقال إلى التبويب السابق
      targetRoute = RoleDefinitions.getPreviousRoute(
        widget.activeRoute,
        widget.user?.roleId,
      );
    }

    if (targetRoute != null && targetRoute != widget.activeRoute) {
      _triggerNavigation(targetRoute);
    }
  }

  void _onDragCancel() {
    _horizontalDragDistance = 0.0;
  }

  void _triggerNavigation(String route) {
    setState(() => _isNavigating = true);

    if (widget.onNavigate != null) {
      widget.onNavigate!(route);
    } else {
      AppNavigationService.instance.goTo(context, route);
    }

    // قفل الحماية المؤقت لمنع الانتقال المزدوج
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 320), () {
      if (mounted) {
        setState(() => _isNavigating = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      onHorizontalDragCancel: _onDragCancel,
      child: widget.child,
    );
  }
}
