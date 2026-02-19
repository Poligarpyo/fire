import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/geolocator/getCurrentLocation.dart';
import '../../domain/entities/firetruck.dart';  
import '../../domain/usecases/usecases/get_firetruck_usecase.dart';
import '../states/firetruck_state.dart';

class FireTruckNotifier extends StateNotifier<FireTruckState> {
  final SendFireTruckUseCase sendFireTruckUseCase;

  FireTruckNotifier(this.sendFireTruckUseCase)
      : super(const FireTruckState.initial());
  File? selectedImage;
  Future<void> sendReport({
    required String incidentType,
    required String severity,
    required String details,
    required File? selectedImage,
  }) async {
    try {
      state = const FireTruckState.loading();

      // 🔥 GPS automatically handled here
      final position = await getCurrentLocation();

      final report = FireTruck(
        incidentType: incidentType,
        severity: severity,
        details: details,
        latitude: position.latitude,
        longitude: position.longitude,
        image: selectedImage,
      );

      await sendFireTruckUseCase(report);

      state = const FireTruckState.success();
    } catch (e) {
      state = FireTruckState.error(e.toString());
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      state = const FireTruckState.initial();
    }
  }
}
