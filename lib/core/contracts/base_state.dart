import 'package:flutter/foundation.dart';

/// الحالات الأساسية الموحدة لجميع واجهات التطبيق (Unified UI State)
@immutable
sealed class UIState<T> {
  const UIState();

  const factory UIState.initial() = UIInitial<T>;
  const factory UIState.loading({T? cachedData}) = UILoading<T>;
  const factory UIState.loaded(T data) = UILoaded<T>;
  const factory UIState.empty({String? message}) = UIEmpty<T>;
  const factory UIState.error(String message, {T? cachedData}) = UIError<T>;
}

final class UIInitial<T> extends UIState<T> {
  const UIInitial();
}

final class UILoading<T> extends UIState<T> {
  final T? cachedData;
  const UILoading({this.cachedData});
}

final class UILoaded<T> extends UIState<T> {
  final T data;
  const UILoaded(this.data);
}

final class UIEmpty<T> extends UIState<T> {
  final String? message;
  const UIEmpty({this.message});
}

final class UIError<T> extends UIState<T> {
  final String message;
  final T? cachedData;
  const UIError(this.message, {this.cachedData});
}
