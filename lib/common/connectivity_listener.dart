import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/provider/connectivity_provider.dart';
import 'app_snackbar.dart';
import '../common/navigation_keys.dart';

class ConnectivityListener extends ConsumerStatefulWidget {
  final Widget child;
  const ConnectivityListener({super.key, required this.child});

  @override
  ConsumerState<ConnectivityListener> createState() =>
      _ConnectivityListenerState();
}

class _ConnectivityListenerState extends ConsumerState<ConnectivityListener> {
  late StreamSubscription<bool> _subscription;

  @override
  void initState() {
    super.initState();
    final service = ref.read(connectivityProvider);

    // Listen for real connectivity
    _subscription = service.connectivityStream.listen((connected) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(connected ? 'Back online!' : 'No internet connection.'),
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
