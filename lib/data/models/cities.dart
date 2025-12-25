import 'package:government_complaints_system/data/models/state.dart';

class Cities {
  final int id;
  final String name;
  final String slug;
  final String? image;
  final String? zipCode;
  final StateModel state;

  Cities({
    required this.id,
    required this.name,
    required this.slug,
    this.image,
    this.zipCode,
    required this.state,
  });

  factory Cities.fromMap(Map<String, dynamic> map) {
    return Cities(
      id: map['id'] ?? -1,
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
      image: map['image'],
      zipCode: map['zip_code'],
      state: StateModel.fromMap(map['state'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'image': image,
      'zip_code': zipCode,
      'state': state.toMap(),
    };
  }

  factory Cities.initial() =>
      Cities(
        id: -1,
        name: '',
        slug: '',
        state: StateModel.initial(),
      );
}