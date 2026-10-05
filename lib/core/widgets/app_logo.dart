import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../utils/context_extensions.dart';

enum AppLogoVariant { auto, light, dark, black }

class AppLogo extends StatelessWidget {
  final double size;
  final double? width;
  final double? height;
  final AppLogoVariant variant;
  final bool withContainer;
  final bool isCircle;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final bool withGlow;
  final String? heroTag;

  const AppLogo({
    super.key,
    this.size = 40.0,
    this.width,
    this.height,
    this.variant = AppLogoVariant.auto,
    this.withContainer = false,
    this.isCircle = false,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.all(6.0),
    this.withGlow = false,
    this.heroTag,
  });

  String _resolveAsset(BuildContext context) {
    switch (variant) {
      case AppLogoVariant.light:
        return AppAssets.logoColor;
      case AppLogoVariant.dark:
        return AppAssets.logoWhite;
      case AppLogoVariant.black:
        return AppAssets.logoBlack;
      case AppLogoVariant.auto:
        return context.isDark ? AppAssets.logoWhite : AppAssets.logoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isDark = context.isDark;
    final assetPath = _resolveAsset(context);
    final finalWidth = width ?? size;
    final finalHeight = height ?? size;

    Widget imageWidget = Image.asset(
      assetPath,
      width: finalWidth,
      height: finalHeight,
      fit: BoxFit.contain,
    );

    if (heroTag != null) {
      imageWidget = Hero(tag: heroTag!, child: imageWidget);
    }

    if (!withContainer) {
      return imageWidget;
    }

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: isDark ? colors.surfaceContainerHigh : colors.surface,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : BorderRadius.circular(borderRadius),
        border: Border.all(color: colors.outlineVariant.withValues(alpha: 0.3)),
        boxShadow: withGlow
            ? [
                BoxShadow(
                  color: colors.primary.withValues(alpha: isDark ? 0.3 : 0.15),
                  blurRadius: 20,
                  spreadRadius: 4,
                ),
                BoxShadow(
                  color: colors.shadow.withValues(alpha: isDark ? 0.3 : 0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: imageWidget,
    );
  }
}
