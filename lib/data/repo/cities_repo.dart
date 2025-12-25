
import 'package:government_complaints_system/data/api/cities_api.dart';

import '../../utils/secure_storage.dart';
import '../models/cities.dart';

class CitiesRepo {
  final CitiesApi citiesApi;

  CitiesRepo({required this.citiesApi});

  Future<List<Cities>> indexCities() async {
    print("Repo: Fetching Courses...");
    final token = await SecureStorage.getToken();
    final response = await citiesApi.indexCities(token: token);
    return response
        .map((e) => Cities.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}