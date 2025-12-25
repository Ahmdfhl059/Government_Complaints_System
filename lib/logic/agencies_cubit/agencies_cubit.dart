import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:government_complaints_system/data/models/agencies.dart';
import 'package:government_complaints_system/data/repo/agencies_repo.dart';

part 'agencies_state.dart';

class AgenciesCubit extends Cubit<AgenciesState> {
  final AgenciesRepo agenciesRepo;

  AgenciesCubit({required this.agenciesRepo}) : super(AgenciesState.initial()){
    indexAgencies();
  }

  Future<void> indexAgencies() async {
    emit(state.copyWith(status: AgenciesStatus.loading));
    print("111111111111111111111111111");
    try {
      final List<Agency> agencies = await agenciesRepo.indexAgencies();
      emit(state.copyWith(status: AgenciesStatus.loaded, agencies: agencies.toList()));
      print(agencies);
      print("22222222222222222222222222");
    } catch (e) {
      emit(state.copyWith(status: AgenciesStatus.error, error: e.toString()));
      print("33333333333333333333333333");
    }
  }
}
