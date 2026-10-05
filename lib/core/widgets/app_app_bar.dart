import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../utils/context_extensions.dart';
import 'app_hover.dart';
import 'app_logo.dart';

/// شريط عنوان علوي موديرن واحترافي مع تأثيرات أنيميشن وحالة الاتصال الحية (Modern Animated App Bar)
class AppAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final bool showLogo;
  final bool showStatus;
  final bool showLanguageToggle;
  final bool showThemeToggle;
  final List<Widget>? extraActions;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
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
    this.actions,
    this.leading,
    this.showBackButton = false,
    this.onBackPressed,
    this.height = 68.0,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  State<AppAppBar> createState() => _AppAppBarState();
}

class _AppAppBarState extends State<AppAppBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _pulseScaleAnimation;
  late final Animation<double> _pulseOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _pulseScaleAnimation = Tween<double>(begin: 1.0, end: 2.3).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeOutQuad),
    );

    _pulseOpacityAnimation = Tween<double>(begin: 0.7, end: 0.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeOutQuad),
    );

    final isTest = !kIsWeb && Platform.environment.containsKey('FLUTTER_TEST');
    if (!isTest) {
      _pulseController.repeat();
    } else {
      _pulseController.value = 0.5;
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final screenWidth = MediaQuery.of(context).size.width;
    final isCompact = context.isMobile || screenWidth < 768;
    final displayTitle = widget.title != null
        ? context.tr(widget.title!)
        : context.tr('app_name');
    final displaySubtitle = widget.subtitle != null
        ? context.tr(widget.subtitle!)
        : context.tr('app_subtitle');

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(
          bottom: BorderSide(
            color: colors.outlineVariant.withValues(alpha: 0.25),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: widget.height,
        titleSpacing: isCompact ? 8 : 16,
        leading:
            widget.leading ??
            (widget.showBackButton
                ? IconButton(
                    icon: const Icon(Icons.arrow_back_rounded),
                    tooltip: context.tr('back'),
                    onPressed:
                        widget.onBackPressed ??
                        () {
                          if (Navigator.of(context).canPop()) {
                            Navigator.of(context).pop();
                          } else {
                            Navigator.of(context).maybePop();
                          }
                        },
                  )
                : null),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.showLogo) ...[
              AppHover(
                builder: (ctx, isHovered) {
                  return AnimatedScale(
                    duration: const Duration(milliseconds: 200),
                    scale: isHovered ? 1.05 : 1.0,
                    child: AppLogo(
                      size: isCompact ? 28 : 34,
                      withContainer: true,
                      borderRadius: 10,
                      padding: const EdgeInsets.all(4),
                    ),
                  );
                },
              ),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    displayTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        (isCompact
                                ? context.textTheme.titleMedium
                                : context.textTheme.titleLarge)
                            ?.copyWith(
                              fontFamily: AppAssets.fontSecondary,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.1,
                              color: colors.onSurface,
                            ),
                  ),
                  if (!isCompact && displaySubtitle.isNotEmpty) ...[
                    const SizedBox(height: 2),
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
                ],
              ),
            ),
          ],
        ),
        actions: [
          // شارة الاتصال الحية كحالة فقط بدون أزرار
          if (widget.showStatus && !isCompact) ...[
            _buildLiveStatusBadge(context, colors),
            const SizedBox(width: 12),
          ],
        ],
      ),
    );
  }

  Widget _buildLiveStatusBadge(BuildContext context, ColorScheme colors) {
    final liveColor = colors.success;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: liveColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: liveColor.withValues(alpha: 0.35),
          width: 0.9,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // نقطة البث الحية النابضة (Pulsing Dot)
          SizedBox(
            width: 14,
            height: 14,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _pulseScaleAnimation.value,
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: liveColor.withValues(
                            alpha: _pulseOpacityAnimation.value,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: liveColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Text(
            context.tr('status_connected'),
            style: TextStyle(
              fontFamily: AppAssets.fontPrimary,
              color: liveColor,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
