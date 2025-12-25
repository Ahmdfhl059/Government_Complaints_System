import '../../utils/dio_methods.dart';
import '../../utils/end_points.dart';
import '../../utils/headers.dart';

class StateApi {
  Future<List<dynamic>> indexState({required String token}) async {
    final endpoint = EndPoints.indexStates;
    print("Calling API: $endpoint");
    final response = await RemoteApi.get(
      endpoint,
      headers: {...headersWithAuth(token)},
    );
    print("API Response: ${response.data}");
    return response.data['data']['states'] as List<dynamic>;
  }
}