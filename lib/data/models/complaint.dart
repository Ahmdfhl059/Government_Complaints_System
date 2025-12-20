import 'agencies.dart';
import 'citizen.dart';
import 'complaintStatus.dart';
import 'complaint_type.dart';

class Complaint {
  final int id;
  final String referenceNumber;
  final Citizen citizen;
  final ComplaintStatus status;
  final ComplaintType complaintType;
  final Agency agency;
  final String description;
  final List<String> documents;
  final String location;
  final City city;
  final String createdAt;
  final String updatedAt;

  Complaint({
    required this.id,
    required this.referenceNumber,
    required this.citizen,
    required this.status,
    required this.complaintType,
    required this.agency,
    required this.description,
    required this.documents,
    required this.location,
    required this.city,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Complaint.fromMap(Map<String, dynamic> map) {
    return Complaint(
      id: map['id'] ?? -1,
      referenceNumber: map['reference_number'] ?? '',
      citizen: Citizen.fromMap(map['citizen'] ?? {}),
      status: ComplaintStatus.fromMap(map['status'] ?? {}),
      complaintType: ComplaintType.fromMap(map['complaint_type'] ?? {}),
      agency: Agency.fromMap(map['agency'] ?? {}),
      description: map['description'] ?? '',
      documents: List<String>.from(map['documents'] ?? []),
      location: map['location'] ?? '',
      city: City.fromMap(map['city'] ?? {}),
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  factory Complaint.initial() => Complaint(
    id: -1,
    referenceNumber: '',
    citizen: Citizen.initial(),
    status: ComplaintStatus.initial(),
    complaintType: ComplaintType.initial(),
    agency: Agency.initial(),
    description: '',
    documents: const [],
    location: '',
    city: City.initial(),
    createdAt: '',
    updatedAt: '',
  );
}
