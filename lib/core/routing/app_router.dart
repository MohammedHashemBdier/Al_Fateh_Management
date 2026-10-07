import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/attendance/domain/models/attendance_record.dart';
import '../../features/attendance/presentation/views/views.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/employees/presentation/views/employees_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/settings/presentation/views/settings_view.dart';
import '../../features/splash/presentation/cubit/splash_cubit.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/tickets/presentation/views/tickets_view.dart';

class AppRouter {
  AppRouter._();

  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String tickets = '/tickets';
  static const String attendance = '/attendance';
  static const String checkIn = '/attendance/check-in';
  static const String attendanceHistory = '/attendance/history';
  static const String attendanceDetails = '/attendance/details/:id';
  static const String attendanceCorrection = '/attendance/correction';
  static const String shiftManagement = '/attendance/shifts';
  static const String attendanceReports = '/attendance/reports';
  static const String employees = '/employees';
  static const String settings = '/settings';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => BlocProvider(
          create: (context) => SplashCubit(),
          child: const SplashView(),
        ),
      ),
      GoRoute(
        path: login,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: home,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: tickets,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const TicketsView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: attendance,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const AttendanceHomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: checkIn,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const CheckInView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: attendanceHistory,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const AttendanceHistoryView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: attendanceDetails,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: AttendanceDetailsView(
            recordId: state.pathParameters['id'] ?? '',
            initialRecord: state.extra as AttendanceRecord?,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: attendanceCorrection,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const AttendanceCorrectionView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: shiftManagement,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ShiftManagementView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: attendanceReports,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const AttendanceReportsView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: employees,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const EmployeesView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: settings,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SettingsView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        ),
      ),
    ],
  );
}
