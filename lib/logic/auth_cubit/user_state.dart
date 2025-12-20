part of 'user_cubit.dart';

enum UserStatus { initial, loading, loaded, error }

class UserState extends Equatable {
  final UserStatus status;
  final Citizen user;
  final String error;

  const UserState({
    required this.status,
    required this.user,
    required this.error,
  });

  factory UserState.initial() => UserState(
    status: UserStatus.initial,
    user: Citizen.initial(),
    error: '',
  );

  UserState copyWith({
    UserStatus? status,
    Citizen? user,
    String? error,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [status, user, error];
}