import 'package:flutter/material.dart';
import '../contracts/base_state.dart';
import 'app_animations.dart';
import 'app_button.dart';
import 'app_card.dart';
import 'app_empty_state.dart';
import 'app_skeleton.dart';
import 'app_text.dart';

/// ويدجيت بناء الحالات الموحد (AppStateBuilder)
/// يتعامل تلقائياً وبشكل موحد مع حالات: التحميل، البيانات، القائمة الفارغة، وحالات الخطأ
class AppStateBuilder<T> extends StatelessWidget {
  final UIState<T> state;
  final Widget Function(BuildContext context, T data) onData;
  final WidgetBuilder? onLoading;
  final WidgetBuilder? onEmpty;
  final Widget Function(BuildContext context, String error)? onError;
  final VoidCallback? onRetry;
  final String? emptyTitle;
  final String? emptySubtitle;

  const AppStateBuilder({
    super.key,
    required this.state,
    required this.onData,
    this.onLoading,
    this.onEmpty,
    this.onError,
    this.onRetry,
    this.emptyTitle,
    this.emptySubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppAnimatedSwitch(
      child: _buildCurrentState(context),
    );
  }

  Widget _buildCurrentState(BuildContext context) {
    switch (state) {
      case UIInitial():
      case UILoading():
        if (onLoading != null) {
          return KeyedSubtree(
            key: const ValueKey('state_loading_custom'),
            child: onLoading!(context),
          );
        }
        return KeyedSubtree(
          key: const ValueKey('state_loading_default'),
          child: ListView.builder(
            itemCount: 5,
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: AppFadeSlide(
                delay: Duration(milliseconds: index * 40),
                child: const AppSkeleton(height: 72, borderRadius: 12),
              ),
            ),
          ),
        );

      case UILoaded(:final data):
        return KeyedSubtree(
          key: const ValueKey('state_loaded_data'),
          child: onData(context, data),
        );

      case UIEmpty(:final message):
        if (onEmpty != null) {
          return KeyedSubtree(
            key: const ValueKey('state_empty_custom'),
            child: onEmpty!(context),
          );
        }
        return KeyedSubtree(
          key: const ValueKey('state_empty_default'),
          child: AppEmptyState(
            title: emptyTitle ?? message ?? 'no_data',
            subtitle: emptySubtitle ?? '',
          ),
        );

      case UIError(:final message):
        if (onError != null) {
          return KeyedSubtree(
            key: const ValueKey('state_error_custom'),
            child: onError!(context, message),
          );
        }
        return KeyedSubtree(
          key: const ValueKey('state_error_default'),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: AppCard(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline_rounded,
                      color: Colors.red,
                      size: 44,
                    ),
                    const SizedBox(height: 12),
                    AppText.title(message),
                    if (onRetry != null) ...[
                      const SizedBox(height: 16),
                      AppButton(
                        label: 'إعادة المحاولة',
                        icon: Icons.refresh_rounded,
                        onPressed: onRetry,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
    }
  }
}
