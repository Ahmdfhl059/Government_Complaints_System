import '../../utils/dio_methods.dart';
import '../../utils/end_points.dart';
import '../../utils/headers.dart';

class AgenciesApi {
  Future<List<dynamic>> indexAgencies({required String token}) async {
    final endpoint = EndPoints.indexCourses;
    print("Calling API: $endpoint");
    final response = await RemoteApi.get(
      endpoint,
      headers: {...headersWithAuth(token)},
    );
    print("API Response: ${response.data}");
    return response.data as List<dynamic>;
  }
}
