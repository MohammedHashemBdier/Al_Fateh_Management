import 'package:flutter_bloc/flutter_bloc.dart';

/// حالة الهيكل الموحد (Scaffold UI State)
class AppScaffoldState {
  final bool isSidebarExpanded;
  final int unreadNotificationsCount;
  final String activeRoute;

  const AppScaffoldState({
    this.isSidebarExpanded = true,
    this.unreadNotificationsCount = 0,
    this.activeRoute = '/home',
  });

  AppScaffoldState copyWith({
    bool? isSidebarExpanded,
    int? unreadNotificationsCount,
    String? activeRoute,
  }) {
    return AppScaffoldState(
      isSidebarExpanded: isSidebarExpanded ?? this.isSidebarExpanded,
      unreadNotificationsCount:
          unreadNotificationsCount ?? this.unreadNotificationsCount,
      activeRoute: activeRoute ?? this.activeRoute,
    );
  }
}

/// متحكم حالة الهيكل الموحد (Scaffold ViewModel / Cubit)
class AppScaffoldCubit extends Cubit<AppScaffoldState> {
  AppScaffoldCubit() : super(const AppScaffoldState());

  void toggleSidebar() {
    emit(state.copyWith(isSidebarExpanded: !state.isSidebarExpanded));
  }

  void setSidebarExpanded(bool expanded) {
    emit(state.copyWith(isSidebarExpanded: expanded));
  }

  void setActiveRoute(String route) {
    if (state.activeRoute != route) {
      emit(state.copyWith(activeRoute: route));
    }
  }

  void setNotificationsCount(int count) {
    emit(state.copyWith(unreadNotificationsCount: count));
  }
}
