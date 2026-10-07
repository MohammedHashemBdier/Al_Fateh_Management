import '../errors/failure.dart';

/// تمثيل نتيجة العمليات في المعمارية النظيفة (Result Pattern)
sealed class Result<T> {
  const Result();

  /// عملية ناجحة تحتوي على البيانات
  const factory Result.success(T data) = Success<T>;

  /// عملية فاشلة تحتوي على كائن الإخفاق
  const factory Result.failure(Failure failure) = FailureResult<T>;

  /// التحقق من النجاح
  bool get isSuccess => this is Success<T>;

  /// التحقق من الفشل
  bool get isFailure => this is FailureResult<T>;

  /// استخراج البيانات في حال النجاح أو null
  T? get dataOrNull => switch (this) {
    Success<T>(data: final data) => data,
    FailureResult<T>() => null,
  };

  /// استخراج كائن الإخفاق في حال الفشل أو null
  Failure? get failureOrNull => switch (this) {
    Success<T>() => null,
    FailureResult<T>(failure: final failure) => failure,
  };

  /// التفرع حسب النتيجة (Pattern Matching)
  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) failure,
  }) {
    return switch (this) {
      Success<T>(data: final d) => success(d),
      FailureResult<T>(failure: final f) => failure(f),
    };
  }
}

/// كائن النجاح
final class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success<T> &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() => 'Result.success($data)';
}

/// كائن الفشل
final class FailureResult<T> extends Result<T> {
  final Failure failure;
  const FailureResult(this.failure);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FailureResult<T> &&
          runtimeType == other.runtimeType &&
          failure == other.failure;

  @override
  int get hashCode => failure.hashCode;

  @override
  String toString() => 'Result.failure($failure)';
}
