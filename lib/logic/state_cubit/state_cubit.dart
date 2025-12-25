import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:government_complaints_system/data/models/state.dart';
import 'package:meta/meta.dart';

import '../../data/repo/state_repo.dart';

part 'state_state.dart';

class StateCubit extends Cubit<StateState> {
  final StateRepo stateRepo;
  StateCubit({required this.stateRepo}) : super(StateState.initial()){
    indexState();
  }
  Future<void> indexState() async {
    emit(state.copyWith(status:  StatesStatus.loading));
    try {
      final List<StateModel> states = await stateRepo.indexState();
      emit(state.copyWith(status: StatesStatus.loaded, states: states));
    } catch (e) {
      emit(state.copyWith(status: StatesStatus.error, error: e.toString()));
    }
  }
}
