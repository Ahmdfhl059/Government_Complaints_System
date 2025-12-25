import 'package:government_complaints_system/data/api/complaint_type_api.dart';

import '../../utils/secure_storage.dart';
import '../models/complaint_type.dart';

class ComplaintTypeRepo {
  final ComplaintTypeApi complaintTypeApi;

  ComplaintTypeRepo({required this.complaintTypeApi});

  Future<List<ComplaintType>> indexComplaintType() async {
    print("Repo: Fetching Courses...");
    final token = await SecureStorage.getToken();
    final response = await complaintTypeApi.indexComplaintType(token: token);
    return response
        .map((e) => ComplaintType.fromMap(e as Map<String, dynamic>))
        .toList();

  }
}