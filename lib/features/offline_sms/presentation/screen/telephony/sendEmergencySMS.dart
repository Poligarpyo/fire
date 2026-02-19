import 'package:telephony/telephony.dart';
import 'package:permission_handler/permission_handler.dart';

final Telephony telephony = Telephony.instance;

Future<void> sendEmergencySMS(String message) async {
  // Check SMS permission
  PermissionStatus status = await Permission.sms.request();
  if (!status.isGranted) {
    throw Exception('SMS permission denied');
  }

  await telephony.sendSms(to: "09975736461", message: message);
}
