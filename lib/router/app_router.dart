// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../common/navigation_keys.dart';
import '../features/account_information/presentation/screen/account_screen.dart';
import '../features/authentication/domain/auth/auth_controller.dart';
import '../features/authentication/presentation/login/login_screen.dart';
import '../features/authentication/presentation/register/backup/register_screen.dart';
import '../features/authentication/presentation/register/register_screen.dart'; 
import '../features/firetruck/presentation/screen/firetruck_tracking.dart';
import '../features/home/presentation/screen/home_screen.dart';
import '../features/report_incident/presentation/screen/report_incident_screen.dart';
import 'fade_extension.dart';

part 'app_router.g.dart';

enum SGRoute {
  home,
  login,
  register,
  forgotPassword,
  accountInfo,
  trackfiretruck,
  reportIncident;

  String get route => '/${toString().replaceAll('SGRoute.', '')}';
  String get name => toString().replaceAll('SGRoute.', '');
}

@riverpod
GoRouter goRouter(Ref ref) {
  final authStatus = ref.watch(authControllerProvider);
  final publicRoutes = [
    SGRoute.login.route,
    SGRoute.register.route,
    SGRoute.forgotPassword.route,
    SGRoute.reportIncident.route,  
    SGRoute.trackfiretruck.route,  
  ];
  return GoRouter(
    // initialLocation: SGRoute.login.route,
    initialLocation: SGRoute.reportIncident.route,
    // initialLocation: SGRoute.trackfiretruck.route,
    navigatorKey: rootNavigatorKey, // ✅ Pass here
    redirect: (context, state) {
      final isAuthenticated = authStatus == AuthStatus.authenticated;
      final isPublicRoute = publicRoutes.contains(state.matchedLocation);

      // If not logged in and trying to access protected route
      if (!isAuthenticated && !isPublicRoute) {
        return SGRoute.login.route;
      }

      // If logged in and trying to access public route
      if (isAuthenticated && isPublicRoute) {
        return SGRoute.home.route;
      }

      return null;
    },

    routes: <GoRoute>[
      GoRoute(
        path: SGRoute.login.route,
        builder: (_, __) => const LoginScreen(),
      ).fade(),
      GoRoute(
        path: SGRoute.register.route,
        builder: (_, __) => const RegisterScreen(),
      ).fade(),
      GoRoute(
        path: SGRoute.home.route,
        builder: (_, __) => HomeScreen(),
      ).fade(),
      GoRoute(
        path: SGRoute.accountInfo.route,
        builder: (_, __) => const AccountScreen(),
      ).fade(),
      GoRoute(
        path: SGRoute.reportIncident.route,
        builder: (_, __) => const ReportIncidentScreen(),
      ).fade(),
      GoRoute(
        path: SGRoute.trackfiretruck.route,
        builder: (_, __) => const FireTruckTrackingScreen(),
      ).fade(),
    ],
  );
}
