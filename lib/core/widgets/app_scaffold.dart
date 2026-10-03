import 'package:flutter/material.dart';
import '../utils/context_extensions.dart';
import 'app_app_bar.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool useDefaultAppBar;
  final String? title;
  final String? subtitle;
  final List<Widget>? extraActions;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final bool applyPadding;
  final EdgeInsetsGeometry? customPadding;
  final bool withGradientBackground;

  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.useDefaultAppBar = true,
    this.title,
    this.subtitle,
    this.extraActions,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.applyPadding = true,
    this.customPadding,
    this.withGradientBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isCompact = context.isMobile;

    PreferredSizeWidget? resolvedAppBar = appBar;
    if (resolvedAppBar == null && useDefaultAppBar) {
      resolvedAppBar = AppAppBar(
        title: title,
        subtitle: subtitle,
        extraActions: extraActions,
      );
    }

    final defaultPadding = EdgeInsets.symmetric(
      horizontal: isCompact ? 16.0 : 24.0,
      vertical: 16.0,
    );

    Widget content = body;
    if (applyPadding) {
      content = Padding(
        padding: customPadding ?? defaultPadding,
        child: content,
      );
    }

    if (withGradientBackground) {
      content = Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colors.surfaceContainerLowest,
                    colors.surfaceContainerLow,
                    colors.surface,
                  ],
                ),
              ),
            ),
          ),
          SafeArea(child: content),
        ],
      );
    }

    return Scaffold(
      appBar: resolvedAppBar,
      body: withGradientBackground ? content : SafeArea(child: content),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
    );
  }
}
