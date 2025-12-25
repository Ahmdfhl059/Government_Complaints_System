

import '../../utils/dio_methods.dart';
import '../../utils/end_points.dart';
import '../../utils/headers.dart';

class CitiesApi {
  Future<List<dynamic>> indexCities({required String token}) async {
    final endpoint = EndPoints.indexCities;
    print("Calling API: $endpoint");
    final response = await RemoteApi.get(
      endpoint,
      headers: {...headersWithAuth(token)},
    );
    print("API Response: ${response.data}");
    return response.data['data']['cities'] as List<dynamic>;
  }
}
