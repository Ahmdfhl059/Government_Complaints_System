import '../../utils/dio_methods.dart';
import '../../utils/end_points.dart';
import '../../utils/headers.dart';
import '../../utils/secure_storage.dart';

class FCMTokenApi {
  Future<Map<String, dynamic>> postFCMToken(String fcmToken) async {
    try {
      Map<String, dynamic> body = {'fcm_token': fcmToken};
      String token = await SecureStorage.getToken();
      var response = await RemoteApi.post(
        EndPoints.fcm,
        headers: headersWithAuth(token),
        body: body,
      );
      if (response.statusCode != 200) {
        throw Exception('error : ${response.statusCode}');
      }
      return response.data;
    } catch (error) {
      rethrow;
    }
  }
}
