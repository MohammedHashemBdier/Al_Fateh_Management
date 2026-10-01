import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/app_assets.dart';
import '../localization/locale_cubit.dart';
import '../utils/context_extensions.dart';

class LocaleToggleButton extends StatelessWidget {
  final bool compact;

  const LocaleToggleButton({super.key, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isArabic = context.isArabic;
    final targetLabel = isArabic ? 'English' : 'العربية';

    if (compact) {
      return IconButton(
        icon: const Icon(Icons.language_rounded, size: 20),
        tooltip: targetLabel,
        onPressed: () => context.read<LocaleCubit>().toggleLocale(),
      );
    }

    return TextButton.icon(
      style: TextButton.styleFrom(
        foregroundColor: colors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      ),
      icon: const Icon(Icons.language_rounded, size: 18),
      label: Text(
        targetLabel,
        style: const TextStyle(
          fontFamily: AppAssets.fontPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
      onPressed: () => context.read<LocaleCubit>().toggleLocale(),
    );
  }
}
