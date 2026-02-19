import 'dart:async'; 
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  late final StreamController<bool> _controller;
  Stream<bool> get connectivityStream => _controller.stream;

  ConnectivityService() {
    _controller = StreamController<bool>.broadcast();
    // Listen to connectivity changes
    _connectivity.onConnectivityChanged.listen((_) => _checkInternet());
    // Initial check
    _checkInternet();
  }

  Future<void> _checkInternet() async {
    bool connected = false;
    try {
      final result = await http
          .get(Uri.parse('https://google.com'))
          .timeout(const Duration(seconds: 3));
      if (result.statusCode == 200) connected = true;
    } catch (_) {
      connected = false;
    }
    _controller.add(connected);
  }

  Future<bool> get isConnected async {
    try {
      final result = await http
          .get(Uri.parse('https://google.com'))
          .timeout(const Duration(seconds: 3));
      return result.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  void dispose() {
    _controller.close();
  }

  
}
