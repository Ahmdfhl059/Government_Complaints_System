import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:government_complaints_system/data/models/cities.dart';
import 'package:government_complaints_system/data/models/state.dart';
import 'package:government_complaints_system/data/repo/cities_repo.dart';
import 'package:meta/meta.dart';

part 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  final CitiesRepo citiesRepo;

  CitiesCubit({required this.citiesRepo}) : super(CitiesState.initial()){
    indexCities();
  }
  Future<void> indexCities() async {
    emit(state.copyWith(status:  CitiesStatus.loading));
    try {
      final List<Cities> cities = await citiesRepo.indexCities();
      emit(state.copyWith(status: CitiesStatus.loaded, cities: cities));
    } catch (e) {
      emit(state.copyWith(status: CitiesStatus.error, error: e.toString()));
    }
  }
}
