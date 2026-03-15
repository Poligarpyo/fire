import 'package:easy_localization/easy_localization.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart'; 

import 'shared/common/connectivity_listener.dart';
import 'shared/common/navigation_keys.dart'; 
import 'core/provider/connectivity_listener_provider.dart'; 
import 'features/authentication/domain/auth/auth_controller.dart';
import 'router/app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(autoSyncProvider); // 👈 activate sync listener
 
    final GoRouter router = ref.watch(goRouterProvider);

    ref.listen<AuthStatus>(authControllerProvider, (previous, next) {
      if (previous == AuthStatus.authenticated &&
          next == AuthStatus.unauthenticated) {}
    }); 

    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerConfig: router,
      title: 'Flutter Production Boilerplate',
      theme: ThemeData(
        primaryColor: const Color(0xFFD32F2F),
        scaffoldBackgroundColor: const Color(0xFFD32F2F),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD32F2F),
          primary: const Color(0xFFD32F2F),
          secondary: const Color(0xFFFFA726),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      // themeMode: currentTheme.themeMode,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, child) {
        return ConnectivityListener(child: child!);
      },
    );
  }
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);
}
