import 'package:government_complaints_system/data/api/agencies_api.dart';
import 'package:government_complaints_system/data/models/agencies.dart';

import '../../utils/secure_storage.dart';

class AgenciesRepo {
  final AgenciesApi agenciesApi;

  AgenciesRepo({required this.agenciesApi});

  Future<List<Agency>> indexAgencies() async {
    print("Repo: Fetching Courses...");
    final token = await SecureStorage.getToken();
    final response = await agenciesApi.indexAgencies(token: token);
    return response
        .map((e) => Agency.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}