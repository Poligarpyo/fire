import '../entities/offline_sms.dart';

abstract class OfflineSmsRepository {
  Future<void> saveOffline(OfflineSms sms); 
  Future<void> syncPendingReports(); 
  Future<void> sendEmergencySMS(String message);
}
