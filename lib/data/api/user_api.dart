
import 'package:image_picker/image_picker.dart';

import '../../utils/dio_methods.dart';
import '../../utils/end_points.dart';
import '../../utils/headers.dart';
import '../../utils/secure_storage.dart';

class UserApi {
  Future<Map<String, dynamic>> userRegister({
    required Map<String, dynamic> data, //phone
  }) async {
    final response = await RemoteApi.post(
      EndPoints.signup,
      headers: headers,
      body: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> userLogin({
    required Map<String, dynamic> data, //phone
  }) async {
    final response = await RemoteApi.post(
      EndPoints.login,
      headers: headers,
      body: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> resendVerificationCode({
    required Map<String, dynamic> data, //phone
  }) async {
    final response = await RemoteApi.post(
      EndPoints.requestCode,
      headers: headers,
      body: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> userVerify({
    required Map<String, dynamic> data,
    required String token,
  }) async {
    final response = await RemoteApi.post(
      EndPoints.verifyEmail,
      headers: headersWithAuth(token),
      body: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> resendUserVerify({
    required String token,
  }) async {
    final response = await RemoteApi.post(
      EndPoints.resendVerifyEmail,
      headers: headersWithAuth(token),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> forgotPassword({
    required Map<String, dynamic> data,
  }) async {
    final response = await RemoteApi.post(
      EndPoints.forgotPassword,
      headers: headers,
      body: data,
    );
    return response.data;
  }
  Future<Map<String, dynamic>> studentLogout() async {
    var token = SecureStorage.getToken();
    final response = await RemoteApi.post(
      EndPoints.logout,
      headers: headersWithAuth(await token),
    );
    SecureStorage.removeToken();
    return response.data;
  }

  Future<Map<String, dynamic>> showStudentProfile({required token}) async {
    print(token);
    if (token.isEmpty) {
      throw Exception('token is empty');
    }
      final response = await RemoteApi.get(
        EndPoints.showProfile,
        headers: headersWithAuth(token),
      );
      return response.data;
    }

  // Future<Map<String, dynamic>> updateStudentProfile({
  //   required Map<String, dynamic> data, //phone
  // }) async {
  //   var token = SecureStorage.getToken();
  //   final response = await RemoteApi.postWithFile(
  //     EndPoints.updateProfile,
  //     headers: headersWithAuth(await token),
  //     body: data,
  //   );
  //   return response.data;
  // }

  Future<Map<String, dynamic>> updateStudentProfile({
   required String firstName,
   required String lastName,
   required String phoneNumber,
   required String birthday,
    XFile? image,
  }) async {
    var token =await SecureStorage.getToken();
    if (image != null) {
      final response = await RemoteApi.postWithFile(
        url: EndPoints.updateProfile,
        fields: {
          "first_name":firstName,
          "last_name":lastName,
          "phone_number":phoneNumber,
          "birthday":birthday,
        },
        filePath: image,
        filesKey: 'image', token: token,
      );
      return response.data;
    } else {
      final response = await RemoteApi.postWithFile(
        url: EndPoints.updateProfile,
        fields: {
          "first_name":firstName,
          "last_name":lastName,
          "phone_number":phoneNumber,
          "birthday":birthday,
        }, token: token,
      );
      return response.data;
    }
  }
}
