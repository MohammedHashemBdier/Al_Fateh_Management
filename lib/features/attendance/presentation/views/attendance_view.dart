import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:al_fateh_management/core/constants/app_assets.dart';
import 'package:al_fateh_management/core/utils/context_extensions.dart';
import 'package:al_fateh_management/core/widgets/widgets.dart';

/// واجهة إدارة الحضور والانصراف والدوام عبر الـ GPS
class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AppDetailScaffold(
      title: 'nav_attendance',
      currentRoute: '/attendance',
      onBackPressed: () => context.go('/home'),
      detailContent: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: AppCard(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: colors.success.withValues(alpha: 0.15),
                    child: Icon(
                      Icons.access_time_filled_rounded,
                      size: 42,
                      color: colors.success,
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppText.headline(
                    'attendance_view_title',
                    textAlign: TextAlign.center,
                    fontFamily: AppAssets.fontSecondary,
                    fontWeight: FontWeight.bold,
                    color: colors.onSurface,
                  ),
                  const SizedBox(height: 10),
                  AppText.body(
                    'attendance_view_desc',
                    textAlign: TextAlign.center,
                    color: colors.onSurfaceVariant,
                  ),
                  const SizedBox(height: 24),
                  AppStatusBadge(status: context.tr('coming_soon')),
                  const SizedBox(height: 28),
                  AppButton(
                    label: context.tr('back'),
                    icon: Icons.arrow_back_rounded,
                    onPressed: () => context.go('/home'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
