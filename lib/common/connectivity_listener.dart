import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/provider/connectivity_provider.dart';
import '../widgets/offline_sms_dialog.dart';
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

    bool _dialogShowing = false;

    _subscription = service.connectivityStream.listen((connected) {
      if (connected) {
        _dialogShowing = false;

        scaffoldMessengerKey.currentState?.showSnackBar(
          const SnackBar(
            content: Text('Back online!'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        if (!_dialogShowing) {
          _dialogShowing = true;

          final context = rootNavigatorKey.currentContext;

          if (context != null) {
            showOfflineSMSDialog(context);
          }
        }
      }
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
