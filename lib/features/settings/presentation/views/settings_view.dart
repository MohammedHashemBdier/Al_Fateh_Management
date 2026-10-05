import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:al_fateh_management/core/constants/app_assets.dart';
import 'package:al_fateh_management/core/utils/context_extensions.dart';
import 'package:al_fateh_management/core/widgets/widgets.dart';

/// واجهة إعدادات التطبيق والحساب
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AppDetailScaffold(
      title: 'settings_view_title',
      currentRoute: '/settings',
      onBackPressed: () => context.go('/home'),
      detailContent: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              AppCard(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.titleLarge(
                      'settings_view_title',
                      fontFamily: AppAssets.fontSecondary,
                      fontWeight: FontWeight.bold,
                      color: colors.onSurface,
                    ),
                    const SizedBox(height: 6),
                    AppText.body(
                      'settings_view_desc',
                      color: colors.onSurfaceVariant,
                    ),
                    const SizedBox(height: 20),
                    const Divider(height: 1, thickness: 0.5),
                    const SizedBox(height: 16),
                    // تبديل المظهر
                    ListTile(
                      leading: Icon(
                        Icons.palette_outlined,
                        color: colors.primary,
                      ),
                      title: const AppText.body('theme_system'),
                      trailing: const ThemeToggleButton(),
                    ),
                    const SizedBox(height: 12),
                    // تبديل اللغة
                    ListTile(
                      leading: Icon(
                        Icons.language_rounded,
                        color: colors.primary,
                      ),
                      title: const AppText.body('lang_switch'),
                      trailing: const LocaleToggleButton(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
