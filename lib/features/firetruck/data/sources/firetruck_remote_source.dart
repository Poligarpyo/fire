import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:riverpod/riverpod.dart';
import '../../../../../constants/dio_helper.dart';
import '../../../../../constants/endpoints.dart';
import '../../../../core/storage/auth_local_datasource.dart';
import '../../../../data/app/app_initializer.dart';
import '../../../../data/repository/network_repository.dart';
import '../../../../exceptions/network_exceptions.dart';
import '../../domain/entities/firetruck.dart';
import '../model/firetruck_model.dart';

class FireTruckRemoteSource {
  final Dio dio;
  final AuthLocalDataSource authLocalDataSource;
  final NetworkRepository networkRepository;
  FireTruckRemoteSource({
    required this.dio,
    required this.authLocalDataSource,
    required this.networkRepository,
  });

  Future<List<FireTruckModel>> fetchFireTruck({
    int page = 1,
    int limit = 10,
    String search = '',
  }) async {
    try {
      final login = authLocalDataSource.getLogin();
      final token = authLocalDataSource.getToken();

      if (login == null || token == null) {
        throw TokenExpiredException();
      }

      final Response response = await networkRepository.state.post(
        '${Endpoints.exampleFireTruck}',
        data: {
          "login": login,
          "token": token,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        return data
            .map((json) =>
                FireTruckModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }

      throw ServerErrorException();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        throw NoInternetException();
      }

      if (e.response?.statusCode == 401) {
        throw TokenExpiredException();
      }

      throw UnknownNetworkException(e.message ?? "Unknown Dio error");
    } catch (e) {
      throw UnknownNetworkException(e.toString());
    }
  }

  Future<void> sendReport(FireTruck report) async {
    FormData formData = FormData.fromMap({
      "incident_type": report.incidentType,
      "severity": report.severity,
      "details": report.details,
      "latitude": report.latitude,
      "longitude": report.longitude,
      if (report.image != null)
        "photo": await MultipartFile.fromFile(
          report.image!.path,
          filename: basename(report.image!.path),
        ),
    });

    final Response response = await networkRepository.state.post(
      '${Endpoints.exampleFireTruck}',
      data: formData,
    );
    
  }
}
