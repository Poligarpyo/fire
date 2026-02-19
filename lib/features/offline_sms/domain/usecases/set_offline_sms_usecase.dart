import '../entities/offline_sms.dart';
import '../repositories/offline_sms_repository.dart';

class SendOfflineSmsUseCase {
  SendOfflineSmsUseCase(this.repository); 
  final OfflineSmsRepository repository; 
  Future<void> execute(OfflineSms sms) async {
    await repository.sendEmergencySMS(sms.message); // Send immediately via SMS
    await repository.saveOffline(sms);
    print("Offline SMS saved successfully");
  }

  /// Optional: manual sync trigger
  Future<void> sync() async {
    await repository.syncPendingReports();
  }
}
