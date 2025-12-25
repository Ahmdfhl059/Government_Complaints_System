import 'package:dio/dio.dart';

import '../../utils/dio_methods.dart';
import '../../utils/end_points.dart';
import '../../utils/headers.dart';

class ComplaintApi {
  Future<Map<String, dynamic>> registerComplaint({
    required String token,
    required FormData data,
  }) async {
    final response = await RemoteApi.post(
      EndPoints.registerComplaint,
      headers: headersWithAuth(token),
      body: data,
    );
    return response.data;
  }
}
