part of 'complaint_cubit.dart';

enum ComplaintStatus { initial, loading, loaded, error }

class ComplaintState extends Equatable {
  final ComplaintStatus status;
  final List<Complaint> complaints;
  final Complaint complaint;
  final String error;

  const ComplaintState({
    required this.status,
    required this.complaints,
    required this.complaint,
    required this.error,
  });

  factory ComplaintState.initial() => ComplaintState(
    status: ComplaintStatus.initial,
    error: '',
    complaints: [],
    complaint: Complaint.initial(),
  );

  @override
  List<Object> get props => [status, complaints, complaint, error];

  ComplaintState copyWith({
    ComplaintStatus? status,
    List<Complaint>? complaints,
    Complaint? complaint,
    String? error,
  }) {
    return ComplaintState(
      status: status ?? this.status,
      complaints: complaints ?? this.complaints,
      complaint: complaint ?? this.complaint,
      error: error ?? this.error,
    );
  }
}
