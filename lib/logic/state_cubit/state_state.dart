part of 'state_cubit.dart';



enum StatesStatus { initial, loading, loaded, error }

class StateState extends Equatable {
  final StatesStatus status;
  final List<StateModel> states;
  final StateModel state;
  final String error;

  const StateState({
    required this.status,
    required this.states,
    required this.state,
    required this.error,
  });

  factory StateState.initial() =>
      StateState(
        status: StatesStatus.initial,
        states: [],
        state: StateModel.initial(),
        error: '',
      );

  @override
  List<Object> get props => [status, states, state, error];

  StateState copyWith({
    StatesStatus? status,
    List<StateModel>? states,
    StateModel? state,
    String? error,
  }) {
    return StateState(
      status: status ?? this.status,
      states: states ?? this.states,
      state: state ?? this.state,
      error: error ?? this.error,
    );
  }
}
