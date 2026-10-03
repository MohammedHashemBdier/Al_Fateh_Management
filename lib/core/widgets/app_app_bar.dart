import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import '../utils/context_extensions.dart';
import 'app_logo.dart';
import 'app_status_badge.dart';
import 'app_theme_language_switchers.dart';
import 'locale_toggle_button.dart';
import 'theme_toggle_button.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final bool showLogo;
  final bool showStatus;
  final bool showLanguageToggle;
  final bool showThemeToggle;
  final List<Widget>? extraActions;
  final Widget? leading;
  final double height;

  const AppAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.showLogo = true,
    this.showStatus = true,
    this.showLanguageToggle = true,
    this.showThemeToggle = true,
    this.extraActions,
    this.leading,
    this.height = 72.0,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final screenWidth = MediaQuery.of(context).size.width;
    final isCompact = context.isMobile || screenWidth < 768;
    final isNarrow = screenWidth < 520;
    final displayTitle = title ?? context.tr('app_name');
    final displaySubtitle = subtitle ?? context.tr('app_subtitle');

    return AppBar(
      toolbarHeight: height,
      titleSpacing: isCompact ? 4 : 12,
      leading: leading,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showLogo && !isNarrow) ...[
            AppLogo(
              size: isCompact ? 24 : 34,
              withContainer: true,
              borderRadius: 8,
              padding: const EdgeInsets.all(3),
            ),
            const SizedBox(width: 6),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  displayTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: (isCompact
                          ? context.textTheme.titleSmall
                          : context.textTheme.titleMedium)
                      ?.copyWith(
                    fontFamily: AppAssets.fontSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (!isCompact && displaySubtitle.isNotEmpty)
                  Text(
                    displaySubtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall?.copyWith(
                      fontFamily: AppAssets.fontPrimary,
                      fontSize: 11,
                      color: colors.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        if (showStatus && !isCompact && extraActions == null) ...[
          AppStatusBadge(status: context.tr('status_connected')),
          const SizedBox(width: 4),
        ],
        if (showLanguageToggle && showThemeToggle) ...[
          const AppThemeLanguageSwitchers(
            compact: true,
            spacing: 2,
          ),
          const SizedBox(width: 2),
        ] else ...[
          if (showLanguageToggle) ...[
            const LocaleToggleButton(compact: true),
            const SizedBox(width: 2),
          ],
          if (showThemeToggle) ...[
            const ThemeToggleButton(size: 18),
            const SizedBox(width: 2),
          ],
        ],
        ...?extraActions,
        const SizedBox(width: 4),
      ],
    );
  }
}
