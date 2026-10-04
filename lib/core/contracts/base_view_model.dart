import 'package:flutter_bloc/flutter_bloc.dart';

/// العقد الأساسي لجميع الـ ViewModels / Cubits في التطبيق
abstract class BaseViewModel<S> extends Cubit<S> {
  BaseViewModel(super.initialState);

  /// دالة لإعادة تهيئة أو تنظيف الموارد عند مغادرة الشاشة
  void dispose() {}
}
