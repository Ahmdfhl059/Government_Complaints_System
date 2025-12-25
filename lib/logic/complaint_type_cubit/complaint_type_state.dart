part of 'complaint_type_cubit.dart';

enum ComplaintTypeStatus { initial, loading, loaded, error }

class ComplaintTypeState extends Equatable {
  final ComplaintTypeStatus status;
  final List<ComplaintType> complaintsType ;
  final ComplaintType complaintType;
  final String error;

  const ComplaintTypeState({
    required this.status,
    required this.complaintsType,
    required this.complaintType,
    required this.error,
  });

  factory ComplaintTypeState.initial() =>
      ComplaintTypeState(
        status: ComplaintTypeStatus.initial,
        complaintsType: [],
        complaintType: ComplaintType.initial(),
        error: '',
      );

  @override
  List<Object> get props => [status, complaintsType, complaintType, error];

  ComplaintTypeState copyWith({
    ComplaintTypeStatus? status,
    List<ComplaintType>? complaintsType,
    ComplaintType? complaintType,
    String? error,
  }) {
    return ComplaintTypeState(
      status: status ?? this.status,
      complaintsType: complaintsType ?? this.complaintsType,
      complaintType: complaintType ?? this.complaintType,
      error: error ?? this.error,
    );
  }
}
