import 'package:flutter/material.dart';
import '../design_system/app_typography.dart';
import '../utils/context_extensions.dart';

enum AppTextVariant {
  displayLarge,
  displayMedium,
  headline,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
  caption,
}

/// ويدجيت النص الموحد للتطبيق (AppText)
/// يمنع استدعاء Text المباشر في الشاشات ويربط كافة النصوص بنظام الثيم والترجمة
class AppText extends StatelessWidget {
  final String text;
  final AppTextVariant variant;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool isTranslated;
  final FontWeight? fontWeight;
  final double? fontSize;
  final String? fontFamily;
  final TextStyle? style;

  const AppText(
    this.text, {
    super.key,
    this.variant = AppTextVariant.bodyMedium,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.isTranslated = true,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.style,
  });

  /// نص من عنوان شاشة أو قسم كبير
  const AppText.headline(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.isTranslated = true,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.style,
  }) : variant = AppTextVariant.headline;

  /// نص من عنوان بطاقة أو عنصر
  const AppText.title(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.isTranslated = true,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.style,
  }) : variant = AppTextVariant.titleMedium;

  /// نص من عنوان بارز
  const AppText.titleLarge(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.isTranslated = true,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.style,
  }) : variant = AppTextVariant.titleLarge;

  /// نص عادي لجسم الصفحة
  const AppText.body(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.isTranslated = true,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.style,
  }) : variant = AppTextVariant.bodyMedium;

  /// نص صغير وتفاصيل
  const AppText.bodySmall(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.isTranslated = true,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.style,
  }) : variant = AppTextVariant.bodySmall;

  /// نص أزرار وبادجات
  const AppText.label(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.isTranslated = true,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.style,
  }) : variant = AppTextVariant.labelMedium;

  /// نص حاشية وتلميح صغير
  const AppText.caption(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.isTranslated = true,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.style,
  }) : variant = AppTextVariant.caption;

  /// نص مباشر لا يحتاج ترجمة (مثل اسم المشترك، التوقيت، أو البيانات الواردة من السيرفر)
  const AppText.literal(
    this.text, {
    super.key,
    this.variant = AppTextVariant.bodyMedium,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.style,
  }) : isTranslated = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final resolvedText = isTranslated ? context.tr(text) : text;
    final defaultColor = color ?? _resolveDefaultColor(colors, variant);
    final baseStyle = style ?? _resolveStyle(variant);

    final finalStyle = baseStyle.copyWith(
      color: defaultColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontFamily: fontFamily,
    );

    return Text(
      resolvedText,
      style: finalStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  TextStyle _resolveStyle(AppTextVariant v) {
    switch (v) {
      case AppTextVariant.displayLarge:
        return AppTypography.displayLarge();
      case AppTextVariant.displayMedium:
        return AppTypography.displayMedium();
      case AppTextVariant.headline:
        return AppTypography.headline();
      case AppTextVariant.titleLarge:
        return AppTypography.titleLarge();
      case AppTextVariant.titleMedium:
        return AppTypography.titleMedium();
      case AppTextVariant.titleSmall:
        return AppTypography.titleSmall();
      case AppTextVariant.bodyLarge:
        return AppTypography.bodyLarge();
      case AppTextVariant.bodyMedium:
        return AppTypography.bodyMedium();
      case AppTextVariant.bodySmall:
        return AppTypography.bodySmall();
      case AppTextVariant.labelLarge:
        return AppTypography.labelLarge();
      case AppTextVariant.labelMedium:
        return AppTypography.labelMedium();
      case AppTextVariant.labelSmall:
        return AppTypography.labelSmall();
      case AppTextVariant.caption:
        return AppTypography.caption();
    }
  }

  Color _resolveDefaultColor(ColorScheme colors, AppTextVariant v) {
    switch (v) {
      case AppTextVariant.displayLarge:
      case AppTextVariant.displayMedium:
      case AppTextVariant.headline:
      case AppTextVariant.titleLarge:
      case AppTextVariant.titleMedium:
      case AppTextVariant.titleSmall:
      case AppTextVariant.bodyLarge:
      case AppTextVariant.bodyMedium:
        return colors.onSurface;
      case AppTextVariant.bodySmall:
      case AppTextVariant.caption:
        return colors.onSurfaceVariant;
      case AppTextVariant.labelLarge:
      case AppTextVariant.labelMedium:
      case AppTextVariant.labelSmall:
        return colors.onSurface;
    }
  }
}
