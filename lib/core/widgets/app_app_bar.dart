import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import '../utils/context_extensions.dart';
import 'app_logo.dart';
import 'app_status_badge.dart';
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
    final isCompact = context.isMobile;
    final displayTitle = title ?? context.tr('app_name');
    final displaySubtitle = subtitle ?? context.tr('app_subtitle');

    return AppBar(
      toolbarHeight: height,
      titleSpacing: isCompact ? 12 : 20,
      leading: leading,
      title: Row(
        children: [
          if (showLogo) ...[
            AppLogo(
              size: isCompact ? 32 : 40,
              withContainer: true,
              borderRadius: 10,
              padding: const EdgeInsets.all(5),
            ),
            const SizedBox(width: 12),
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
                if (displaySubtitle.isNotEmpty)
                  Text(
                    displaySubtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall?.copyWith(
                      fontFamily: AppAssets.fontPrimary,
                      fontSize: isCompact ? 10 : 12,
                      color: colors.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        if (showStatus) ...[
          if (!isCompact)
            AppStatusBadge(status: context.tr('status_connected'))
          else
            Tooltip(
              message: context.tr('status_connected'),
              child: AppStatusBadge(
                status: context.tr('status_connected_short'),
                showDot: true,
              ),
            ),
          const SizedBox(width: 8),
        ],
        if (showLanguageToggle) ...[
          LocaleToggleButton(compact: isCompact),
          const SizedBox(width: 4),
        ],
        if (showThemeToggle) ...[
          const ThemeToggleButton(),
          const SizedBox(width: 4),
        ],
        ...?extraActions,
        const SizedBox(width: 8),
      ],
    );
  }
}
