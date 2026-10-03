import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/home_repository.dart';
import '../../data/repositories/home_repository_impl.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;

  HomeCubit({HomeRepository? repository})
      : _repository = repository ?? HomeRepositoryImpl(),
        super(const HomeInitial()) {
    loadHomeData();
  }

  /// تحميل بيانات المستخدم والإحصائيات بنمط Cache-First الفوري
  Future<void> loadHomeData() async {
    try {
      final user = await _repository.getCurrentUser();
      if (user == null) {
        emit(const HomeError('auth_session_expired'));
        return;
      }

      // 1. قراءة الكاش المحلي المشفر فوراً (أقل من 5 مللي ثانية)
      final cachedStats = await _repository.getCachedStats();
      if (cachedStats != null) {
        // إظهار لوحة التحكم والبيانات فوراً بدون أي شاشة انتظار
        emit(HomeLoaded(
          user: user,
          stats: cachedStats,
          selectedNavIndex: 0,
          isOffline: !cachedStats.isServerConnected,
          isRefreshing: true,
        ));
      } else {
        // حالة الفتح لأول مرة إطلاقاً قبل أي كاش: عرض هيكل الـ Skeleton المتكامل
        emit(HomeLoading(cachedUser: user));
      }

      // 2. مزامنة وجلب أحدث البيانات الحية بالخلفية بدون تعطيل المستخدم
      final freshStats = await _repository.getDashboardStats(forceRefresh: true);
      final currentIndex = (state is HomeLoaded) ? (state as HomeLoaded).selectedNavIndex : 0;
      emit(HomeLoaded(
        user: user,
        stats: freshStats,
        selectedNavIndex: currentIndex,
        isOffline: !freshStats.isServerConnected,
        isRefreshing: false,
      ));
    } catch (e) {
      if (state is! HomeLoaded) {
        emit(HomeError(e.toString()));
      }
    }
  }

  /// تغيير التبويب النشط في شريط التنقل
  void selectTab(int index) {
    if (state is HomeLoaded) {
      final current = state as HomeLoaded;
      emit(current.copyWith(selectedNavIndex: index));
    }
  }

  /// تحديث البيانات يدوياً
  Future<void> refreshData() async {
    if (state is HomeLoaded) {
      final current = state as HomeLoaded;
      try {
        final newStats = await _repository.getDashboardStats(forceRefresh: true);
        emit(current.copyWith(
          stats: newStats,
          isOffline: !newStats.isServerConnected,
        ));
      } catch (_) {
        // الحفاظ على الحالة الحالية عند فشل التحديث
      }
    }
  }

  /// تسجيل الخروج
  Future<void> logout() async {
    try {
      await _repository.logout();
    } catch (_) {}
  }
}
