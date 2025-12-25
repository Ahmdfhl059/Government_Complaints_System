import 'package:dio/dio.dart';
import 'package:government_complaints_system/data/api/complaint_api.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/secure_storage.dart';

class ComplaintRepo {
  final ComplaintApi complaintApi;

  ComplaintRepo({required this.complaintApi});

  Future<Map<String, dynamic>> registerComplaint({
    required int? complaintTypeId,
    required int? agencyId,
    required String description,
    required String location,
    required List<XFile> documents,
    required int? countryId,
    required int? stateId,
    required int? cityId,
  }) async {
    try {
      List<MultipartFile> files = [];
      for (var doc in documents) {
        files.add(await MultipartFile.fromFile(doc.path, filename: doc.name));
      }

      FormData formData = FormData.fromMap({
        "complaint_type_id": complaintTypeId,
        "agency_id": agencyId,
        "description": description,
        "location": location,
        "country_id": countryId,
        "state_id": stateId,
        "city_id": cityId,
        "documents": files,
      });
      final token = await SecureStorage.getToken();
      final response = await complaintApi.registerComplaint(
        data: formData,
        token: token,
      );
      return response;
    } catch (e) {
      print('error in repo :${e.toString()}');
      rethrow;
    }
  }
}
