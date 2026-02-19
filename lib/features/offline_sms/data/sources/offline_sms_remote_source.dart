import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:riverpod/riverpod.dart';
import '../../../../../constants/dio_helper.dart';
import '../../../../../constants/endpoints.dart';
import '../../../../core/storage/auth_local_datasource.dart';
import '../../../../data/app/app_initializer.dart';
import '../../../../data/repository/network_repository.dart';
import '../../../../exceptions/network_exceptions.dart';
import '../../domain/entities/offline_sms.dart';
import '../model/offline_sms_model.dart';

// features/offline_sms/data/sources/offline_sms_remote_source.dart
class OfflineSmsRemoteSource {
  final Dio dio;
  final AuthLocalDataSource authLocalDataSource;

  OfflineSmsRemoteSource({
    required this.dio,
    required this.authLocalDataSource,
  });

  Future<bool> sendReport(OfflineSmsModel sms) async {
    final data = {
      "id": sms.id,
      "message": sms.message,
      "latitude": sms.latitude,
      "longitude": sms.longitude,
      "sentViaSms": sms.sentViaSms ? 1 : 0,
      "createdAt":
          sms.createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
 
    };

    final token = await authLocalDataSource.getToken();

    final response = await dio.post(
      Endpoints.exampleOfflineSms,
      data: data,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw Exception("Failed to send offline SMS");
    }
  }
}
