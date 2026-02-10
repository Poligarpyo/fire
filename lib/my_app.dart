import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/app_snackbar.dart';
import 'common/connectivity_listener.dart';
import 'common/navigation_keys.dart';
import 'config/theme/theme_logic.dart';
import 'config/theme/theme_ui_model.dart';
import 'core/provider/connectivity_provider.dart';
import 'features/authentication/domain/auth/auth_controller.dart';
import 'router/app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeUiModel currentTheme = ref.watch(themeLogicProvider);
    final GoRouter router = ref.watch(goRouterProvider);
    // Listen for logout events
    ref.listen<AuthStatus>(authControllerProvider, (previous, next) {
      if (previous == AuthStatus.authenticated &&
          next == AuthStatus.unauthenticated) {}
    });

    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerConfig: router,
      title: 'Flutter Production Boilerplate',
      theme: FlexThemeData.light(
        scheme: FlexScheme.deepBlue,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          useM2StyleDividerInM3: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        swapLegacyOnMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(),
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.deepBlue,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useM2StyleDividerInM3: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        swapLegacyOnMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(),
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      themeMode: currentTheme.themeMode,
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
