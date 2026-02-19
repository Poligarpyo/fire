import '../entities/offline_sms.dart';

abstract class OfflineSmsRepository {
  Future<void> saveOffline(OfflineSms sms); 
  Future<void> syncPendingReports();
  Future<void> markAsSent(String id);
  Future<void> sendEmergencySMS(String message);
}
