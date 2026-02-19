import 'dart:io';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';

class OfflineSms {
  final String id;
  final String message;
  final String phoneNumber; // Add this field
  final double latitude;
  final double longitude;
  final bool sentViaSms;
  final int syncStatus; // optional if you want to track sync in entity
  final DateTime createdAt; 
  final File? image; // optional if needed

  OfflineSms({
    required this.id,
    required this.message,
    required this.phoneNumber, // Add this field
    required this.latitude,
    required this.longitude,
    this.sentViaSms = false,
    this.syncStatus = 0,
    DateTime? createdAt,
    this.image,
  }) : createdAt = createdAt ?? DateTime.now();

  EmergencyReportsCompanion toCompanion({required bool sent}) {
    return EmergencyReportsCompanion(
      id: Value(id),
      message: Value(message),
      phoneNumber: Value(phoneNumber), // Add this line
      latitude: Value(latitude),
      longitude: Value(longitude),
      sentViaSms: Value(sentViaSms ? 1 : 0),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
    );
  }
}
