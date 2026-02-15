import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentLocation() async {
  // Check if location services are enabled
  if (!await Geolocator.isLocationServiceEnabled()) {
    throw 'Location services are disabled.';
  }

  // Check permissions
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw 'Location permissions are denied';
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw 'Location permissions are permanently denied';
  }

  // Get current position
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}
