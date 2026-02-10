// ignore_for_file: always_put_control_body_on_new_line

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

import 'constants/strings.dart';
import 'core/storage/auth_local_datasource.dart';
import 'data/app/app_initializer.dart';
import 'hive/hive.dart';
import 'my_app.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initHive();
  await setPreferredOrientations();
  await Hive.initFlutter();
  await Hive.openBox(authBoxName);

  // ✅ ProviderContainer for pre-initializing providers
  final container = ProviderContainer();
  await container.read(appInitializerProvider.future);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('tr')],
        path: Strings.localizationsPath,
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}
