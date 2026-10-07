import '../contracts/result.dart';

/// الواجهة الأساسية لحالات الاستخدام في النمط المعماري Clean Architecture
abstract class BaseUseCase<T, Params> {
  const BaseUseCase();

  /// تنفيذ حالة الاستخدام
  Future<Result<T>> call(Params params);
}

/// تمثيل حالة عدم وجود بارامترات مطلوبة لحالة الاستخدام
class NoParams {
  const NoParams();

  @override
  bool operator ==(Object other) => identical(this, other) || other is NoParams;

  @override
  int get hashCode => 0;
}
