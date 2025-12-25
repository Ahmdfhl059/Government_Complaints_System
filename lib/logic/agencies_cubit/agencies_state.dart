part of 'agencies_cubit.dart';


enum AgenciesStatus { initial, loading, loaded, error }

class AgenciesState extends Equatable {
  final AgenciesStatus status;
  final List<Agency> agencies;
  final Agency agency;
  final String error;

  const AgenciesState({
    required this.status,
    required this.agencies,
    required this.agency,
    required this.error,
  });

  factory AgenciesState.initial() =>
      AgenciesState(
        status: AgenciesStatus.initial,
        agencies: [],
        agency: Agency.initial(),
        error: '',
      );

  @override
  List<Object> get props => [status, agencies, agency, error];

  AgenciesState copyWith({
    AgenciesStatus? status,
    List<Agency>? agencies,
    Agency? agency,
    String? error,
  }) {
    return AgenciesState(
      status: status ?? this.status,
      agencies: agencies ?? this.agencies,
      agency: agency ?? this.agency,
      error: error ?? this.error,
    );
  }
}
