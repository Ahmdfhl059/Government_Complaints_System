import 'agencies.dart';

class ComplaintType {
  final int id;
  final String name;
  final String code;
  final String description;
  final Agency? agency;

  ComplaintType({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    this.agency,
  });

  factory ComplaintType.fromMap(Map<String, dynamic> map) {
    return ComplaintType(
      id: map['id'] ?? -1,
      name: map['name'] ?? '',
      code: map['code'] ?? '',
      description: map['description'] ?? '',
      agency: map['agency'] != null
          ? Agency.fromMap(map['agency'])
          : null,
    );
  }

  factory ComplaintType.initial() => ComplaintType(
    id: -1,
    name: 'empty',
    code: '',
    description: '',
    agency: null,
  );
}
