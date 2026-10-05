import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/app_assets.dart';
import '../theme/theme_cubit.dart';
import '../utils/context_extensions.dart';

/// زر ثلاثي لاختيار الثيم (تلقائي مع الجهاز / نهاري / ليلي)
class ThemeToggleButton extends StatelessWidget {
  final double size;

  const ThemeToggleButton({super.key, this.size = 20.0});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final currentMode = context.watch<ThemeCubit>().state;

    IconData displayIcon;
    switch (currentMode) {
      case ThemeMode.system:
        displayIcon = Icons.brightness_auto_rounded;
        break;
      case ThemeMode.light:
        displayIcon = Icons.light_mode_rounded;
        break;
      case ThemeMode.dark:
        displayIcon = Icons.dark_mode_rounded;
        break;
    }

    return PopupMenuButton<ThemeMode>(
      tooltip: context.tr('theme_system'),
      icon: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: colors.surfaceContainerHighest.withValues(alpha: 0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(displayIcon, size: size, color: colors.onSurface),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      color: colors.surfaceContainer,
      onSelected: (mode) {
        context.read<ThemeCubit>().setThemeMode(mode);
      },
      itemBuilder: (BuildContext context) => [
        _buildPopupItem(
          context: context,
          value: ThemeMode.system,
          icon: Icons.brightness_auto_rounded,
          titleKey: 'theme_system',
          isSelected: currentMode == ThemeMode.system,
        ),
        _buildPopupItem(
          context: context,
          value: ThemeMode.light,
          icon: Icons.light_mode_rounded,
          titleKey: 'theme_light',
          isSelected: currentMode == ThemeMode.light,
        ),
        _buildPopupItem(
          context: context,
          value: ThemeMode.dark,
          icon: Icons.dark_mode_rounded,
          titleKey: 'theme_dark',
          isSelected: currentMode == ThemeMode.dark,
        ),
      ],
    );
  }

  PopupMenuItem<ThemeMode> _buildPopupItem({
    required BuildContext context,
    required ThemeMode value,
    required IconData icon,
    required String titleKey,
    required bool isSelected,
  }) {
    final colors = context.colors;
    final color = isSelected ? colors.primary : colors.onSurface;

    return PopupMenuItem<ThemeMode>(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              context.tr(titleKey),
              style: TextStyle(
                fontFamily: AppAssets.fontPrimary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: color,
                fontSize: 13,
              ),
            ),
          ),
          if (isSelected)
            Icon(Icons.check_rounded, size: 18, color: colors.primary),
        ],
      ),
    );
  }
}
