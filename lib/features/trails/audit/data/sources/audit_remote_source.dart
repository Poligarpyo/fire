import 'package:dio/dio.dart';
import '../../../../../constants/dio_helper.dart';
import '../../../../../constants/endpoints.dart';
import '../model/audit_model.dart';

class AuditRemoteSource {
  final Dio dio;

  AuditRemoteSource({required this.dio});

  Future<List<AuditModel>> fetchAudit(
      {int page = 1, int limit = 10, String search = ''}) async {
    try {
      final Response response = await DioHelper.get(
        '${Endpoints.hfrsBaseUrl}${Endpoints.fetchAuditTrail}',
        queryParams: {
          'page': page,
          'limit': limit,
          'search': search,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] as List<dynamic>;
        return data
            .map((json) => AuditModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load audits');
      }
    } catch (e) {
      // You can customize errors or wrap in a Failure class
      throw Exception('Error fetching audits: $e');
    }
  }
}
