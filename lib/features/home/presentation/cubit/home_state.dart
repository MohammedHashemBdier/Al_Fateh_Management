import '../../../auth/domain/models/user_model.dart';
import '../../domain/models/dashboard_stats_model.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  final UserModel? cachedUser;

  const HomeLoading({this.cachedUser});
}

class HomeLoaded extends HomeState {
  final UserModel user;
  final DashboardStatsModel stats;
  final int selectedNavIndex;
  final bool isOffline;
  final bool isRefreshing;

  const HomeLoaded({
    required this.user,
    required this.stats,
    this.selectedNavIndex = 0,
    this.isOffline = false,
    this.isRefreshing = false,
  });

  HomeLoaded copyWith({
    UserModel? user,
    DashboardStatsModel? stats,
    int? selectedNavIndex,
    bool? isOffline,
    bool? isRefreshing,
  }) {
    return HomeLoaded(
      user: user ?? this.user,
      stats: stats ?? this.stats,
      selectedNavIndex: selectedNavIndex ?? this.selectedNavIndex,
      isOffline: isOffline ?? this.isOffline,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}

class HomeError extends HomeState {
  final String errorMessage;

  const HomeError(this.errorMessage);
}
