import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:al_fateh_management/core/constants/app_assets.dart';
import 'package:al_fateh_management/core/utils/context_extensions.dart';
import 'package:al_fateh_management/core/widgets/app_app_bar.dart';
import 'package:al_fateh_management/core/widgets/app_card.dart';
import 'package:al_fateh_management/core/widgets/app_scaffold.dart';
import 'package:al_fateh_management/core/widgets/locale_toggle_button.dart';
import 'package:al_fateh_management/core/widgets/theme_toggle_button.dart';

/// واجهة إعدادات التطبيق والحساب
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AppScaffold(
      appBar: AppAppBar(
        title: context.tr('settings_view_title'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          tooltip: context.tr('back'),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Center(
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
                    Text(
                      context.tr('settings_view_title'),
                      style: context.textTheme.titleLarge?.copyWith(
                        fontFamily: AppAssets.fontSecondary,
                        fontWeight: FontWeight.bold,
                        color: colors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      context.tr('settings_view_desc'),
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontFamily: AppAssets.fontPrimary,
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(height: 1, thickness: 0.5),
                    const SizedBox(height: 16),
                    // تبديل المظهر
                    ListTile(
                      leading: Icon(Icons.palette_outlined, color: colors.primary),
                      title: Text(
                        context.tr('theme_system'),
                        style: const TextStyle(fontFamily: AppAssets.fontPrimary),
                      ),
                      trailing: const ThemeToggleButton(),
                    ),
                    const SizedBox(height: 12),
                    // تبديل اللغة
                    ListTile(
                      leading: Icon(Icons.language_rounded, color: colors.primary),
                      title: Text(
                        context.tr('lang_switch'),
                        style: const TextStyle(fontFamily: AppAssets.fontPrimary),
                      ),
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
