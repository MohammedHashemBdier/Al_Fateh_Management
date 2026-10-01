import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/app_assets.dart';
import '../localization/locale_cubit.dart';
import '../utils/context_extensions.dart';

/// زر ثلاثي لاختيار لغة التطبيق (تلقائي مع الجهاز / العربية / English)
class LocaleToggleButton extends StatelessWidget {
  final bool compact;

  const LocaleToggleButton({super.key, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final localeState = context.watch<LocaleCubit>().state;
    final isArabic = context.isArabic;

    // تحديد المفتاح الحالي
    final currentKey = localeState == null ? 'system' : localeState.languageCode;

    // نص الزر في الواجهة العريضة
    final currentLabel = localeState == null
        ? context.tr('lang_system')
        : (isArabic ? 'العربية' : 'English');

    final childWidget = compact
        ? Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: colors.surfaceContainerHighest.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.language_rounded, size: 20, color: colors.onSurface),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: colors.surfaceContainerHighest.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: colors.outline.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.language_rounded, size: 16, color: colors.primary),
                const SizedBox(width: 6),
                Text(
                  currentLabel,
                  style: TextStyle(
                    fontFamily: AppAssets.fontPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: colors.onSurface,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 18,
                  color: colors.onSurfaceVariant,
                ),
              ],
            ),
          );

    return PopupMenuButton<String>(
      tooltip: context.tr('lang_system'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      color: colors.surfaceContainer,
      onSelected: (key) {
        final cubit = context.read<LocaleCubit>();
        if (key == 'system') {
          cubit.setSystem();
        } else if (key == 'ar') {
          cubit.setArabic();
        } else if (key == 'en') {
          cubit.setEnglish();
        }
      },
      itemBuilder: (BuildContext context) => [
        _buildPopupItem(
          context: context,
          value: 'system',
          icon: Icons.phonelink_setup_rounded,
          titleKey: 'lang_system',
          isSelected: currentKey == 'system',
        ),
        _buildPopupItem(
          context: context,
          value: 'ar',
          icon: Icons.translate_rounded,
          titleKey: 'lang_ar',
          isSelected: currentKey == 'ar',
          subtitle: 'العربية',
        ),
        _buildPopupItem(
          context: context,
          value: 'en',
          icon: Icons.translate_rounded,
          titleKey: 'lang_en',
          isSelected: currentKey == 'en',
          subtitle: 'English',
        ),
      ],
      child: childWidget,
    );
  }

  PopupMenuItem<String> _buildPopupItem({
    required BuildContext context,
    required String value,
    required IconData icon,
    required String titleKey,
    required bool isSelected,
    String? subtitle,
  }) {
    final colors = context.colors;
    final color = isSelected ? colors.primary : colors.onSurface;

    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              subtitle ?? context.tr(titleKey),
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
