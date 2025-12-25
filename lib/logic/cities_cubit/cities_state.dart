part of 'cities_cubit.dart';



enum CitiesStatus { initial, loading, loaded, error }

class CitiesState extends Equatable {
  final CitiesStatus status;
  final List<Cities> cities;
  final Cities citie;
  final String error;

  const CitiesState({
    required this.status,
    required this.cities,
    required this.citie,
    required this.error,
  });

  factory CitiesState.initial() =>
      CitiesState(
        status: CitiesStatus.initial,
        cities: [],
        citie: Cities.initial(),
        error: '',
      );

  @override
  List<Object> get props => [status, cities, citie, error];

  CitiesState copyWith({
    CitiesStatus? status,
    List<Cities>? cities,
    Cities? citie,
    String? error,
  }) {
    return CitiesState(
      status: status ?? this.status,
      cities: cities ?? this.cities,
      citie: citie ?? this.citie,
      error: error ?? this.error,
    );
  }
}
