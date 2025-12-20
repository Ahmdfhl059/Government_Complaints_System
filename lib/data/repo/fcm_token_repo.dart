import '/data/api/fcm_token_apis.dart';

class FCMTokenRepo {
  var fcmTokenApis = FCMTokenApi();

  Future<void> postFCMToken(String fcmToken) async {
    try {
      await fcmTokenApis.postFCMToken(fcmToken);
    } catch (error) {
      rethrow;
    }
  }
}
