import 'package:dio/dio.dart'; 
import '../../../../../constants/endpoints.dart';
import '../../../../constants/dio_helper.dart';
import '../../../../core/storage/auth_local_datasource.dart'; 
import '../model/account_model.dart';

class AccountRemoteSource {
  final Dio dio;
  final AuthLocalDataSource authLocalDataSource;
  AccountRemoteSource({
    required this.dio,
    required this.authLocalDataSource,
  });

  Future<AccountModel> fetchAccount() async {
    try {
      final login = authLocalDataSource.getLogin();
      final token = authLocalDataSource.getToken();

      if (login == null || token == null) {
        throw Exception('❌ No login or token found in local storage');
      }

      final Response response = await DioHelper.post(
        '${Endpoints.peanutUrl}${Endpoints.exampleAccount}',
        data: {
          "login": login,
          "token": token,
        }, 
      );

      return AccountModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw Exception(
        '❌ Errors [${e.response?.statusCode}] => ${e.message}',
      );
    }
  }

  Future<String> fetchLastFourNumber() async {
    try {
      final login = authLocalDataSource.getLogin();
      final token = authLocalDataSource.getToken();

      if (login == null || token == null) {
        throw Exception('❌ No login or token found in local storage');
      }

      final Response response = await dio.post(
        '${Endpoints.peanutUrl}${Endpoints.exampleNumber}',
        data: {
          "login": login,
          "token": token,
        },
        options: Options(
          headers: {
            "accept": "*/*",
            "Content-Type": "application/json-patch+json",
          },
          responseType: ResponseType.plain, // ✅ tell Dio it’s plain text
        ),
      );

      // The body is just a string
      final String lastFour = response.data.toString();
      return lastFour;
    } on DioException catch (e) {
      throw Exception(
        '❌ Error111 [${e.response?.statusCode}] => ${e.message}',
      );
    }
  }
 
}
