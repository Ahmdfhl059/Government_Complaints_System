
import 'package:government_complaints_system/data/api/state_api.dart';

import '../../utils/secure_storage.dart';
import '../models/state.dart';

class StateRepo {
  final StateApi stateApi;

  StateRepo({required this.stateApi});

  Future<List<StateModel>> indexState() async {
    print("Repo: Fetching Courses...");
    final token = await SecureStorage.getToken();
    final response = await stateApi.indexState(token: token);
    return response
        .map((e) => StateModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}