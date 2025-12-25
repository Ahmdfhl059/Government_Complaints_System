
import '../../utils/dio_methods.dart';
import '../../utils/end_points.dart';
import '../../utils/headers.dart';

class ComplaintTypeApi {
  Future<List<dynamic>> indexComplaintType({required String token}) async {
    final endpoint = EndPoints.indexComplaintType;
    print("Calling API: $endpoint");
    final response = await RemoteApi.get(
      endpoint,
      headers: {...headersWithAuth(token)},
    );
    print("API Response: ${response.data}");
    return response.data["data"]["complaint_types"] as List<dynamic>;
  }
}
