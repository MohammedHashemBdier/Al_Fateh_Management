import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme/theme_cubit.dart';
import '../utils/context_extensions.dart';

class ThemeToggleButton extends StatelessWidget {
  final double size;

  const ThemeToggleButton({super.key, this.size = 20.0});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;

    return IconButton(
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, anim) => RotationTransition(
          turns: anim,
          child: FadeTransition(opacity: anim, child: child),
        ),
        child: Icon(
          isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
          key: ValueKey<bool>(isDark),
          size: size,
        ),
      ),
      tooltip: isDark ? context.tr('theme_light') : context.tr('theme_dark'),
      onPressed: () => context.read<ThemeCubit>().toggleTheme(),
    );
  }
}
