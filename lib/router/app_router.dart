// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../common/navigation_keys.dart';
import '../core/storage/auth_local_datasource.dart';
import '../core/storage/auth_local_datasource_provider.dart';
import '../features/account_information/presentation/screen/account_screen.dart';
import '../features/authentication/domain/auth/auth_controller.dart';
import '../features/authentication/presentation/login/login_screen.dart';
import '../features/home/presentation/screen/home_screen.dart';
import '../features/trails/audit/domain/entities/Audit.dart';
import '../features/trails/audit/presentation/screens/audit_screen.dart';
import '../features/trails/trails_screen.dart';
import 'fade_extension.dart';

part 'app_router.g.dart';

enum SGRoute {
  home,
  login,
  register,
  forgotPassword,
  profile,
  editProfile,
  household,
  family,
  indiv,
  reports,
  trails,
  accountInfo,
  audit;

  String get route => '/${toString().replaceAll('SGRoute.', '')}';
  String get name => toString().replaceAll('SGRoute.', '');
}

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final authStatus = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: SGRoute.login.route,
    navigatorKey: rootNavigatorKey, // ✅ Pass here
    redirect: (context, state) {
      final isLoggingIn = state.fullPath == SGRoute.login.route;

      if (authStatus == AuthStatus.unauthenticated && !isLoggingIn) {
        return SGRoute.login.route;
      }

      if (authStatus == AuthStatus.authenticated && isLoggingIn) {
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
        path: SGRoute.home.route,
        builder: (_, __) => HomeScreen(),
      ).fade(),
      GoRoute(
        path: SGRoute.audit.route,
        builder: (_, __) => const AuditScreen(),
      ).fade(),
      GoRoute(
        path: SGRoute.accountInfo.route,
        builder: (_, __) => const AccountScreen(),
      ).fade(),
    ],
  );
}
