import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telephony/telephony.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/database_providers.dart';
import '../../../../core/services/connectivity_service.dart';
import '../../../../exceptions/no_internet_exception.dart';
import '../../domain/entities/offline_sms.dart';
import '../../domain/repositories/offline_sms_repository.dart';
import '../model/offline_sms_model.dart';
import '../sources/offline_sms_remote_source.dart';
import 'package:telephony/telephony.dart';
import 'package:permission_handler/permission_handler.dart';

// features/offline_sms/data/repositories/offline_sms_repository_impl.dart
class OfflineSmsRepositoryImpl implements OfflineSmsRepository {
  final AppDatabase database;
  final OfflineSmsRemoteSource remoteDataSource;
  final ConnectivityService connectivity;
  final Telephony telephony; // 👈 ADD THIS
  OfflineSmsRepositoryImpl({
    required this.database,
    required this.remoteDataSource,
    required this.connectivity,
    required this.telephony,
  });

  /// Save offline SMS locally
  @override
  Future<void> saveOffline(OfflineSms sms) async {
    await database.insertReport(sms.toCompanion(sent: false));
  }

  // Called automatically when internet is back
  @override
  Future<void> syncPendingReports() async {
    print("SYNC TRIGGERED");

    final isConnected = await connectivity.isConnected;
    print("Internet status: $isConnected");
    // final deletedCount = await database.deleteAllReports();
    // print("Deleted $deletedCount rows from emergencyReports");
    if (!isConnected) return;

    final pending = await database.getPendingReports();

    for (final item in pending) {
      final model = item.toEntity();
      print(model.toJson());
    }
    print("Pending reports count: ${pending.length}");

    if (pending.isEmpty) return;

    for (final item in pending) {
      try {
        print("Sending report ID: ${item.id}");

        await remoteDataSource.sendReport(item.toEntity());

        print("Report sent successfully: ${item.id}");

        await database.updateReportSyncStatus(item.id);
      } catch (e) {
        print("Sync failed: $e");
        break;
      }
    }
  }

  @override
  Future<void> markAsSent(String id) async {
    // final sms = await localDataSource.getById(id);

    // if (sms != null) {
    //   final updated = sms.copyWith(sentViaSms: true);
    //   await localDataSource.update(updated);
    // }
  }

  @override
  Future<void> sendEmergencySMS(String message) async {
    // Check SMS permission
    PermissionStatus status = await Permission.sms.request();
    if (!status.isGranted) {
      throw Exception('SMS permission denied');
    }

    await telephony.sendSms(to: "09975736461", message: message);
  } 
}

extension on EmergencyReport {
  OfflineSmsModel toEntity() {
    return OfflineSmsModel(
      id: id,
      message: message,
      phoneNumber: phoneNumber ?? '',
      latitude: latitude,
      longitude: longitude,
      sentViaSms: sentViaSms == 1,
      syncStatus: syncStatus,
      createdAt: createdAt,
    );
  }
}
