import 'agencies.dart';

class StateModel {
  final int id;
  final String name;
  final String slug;
  final String abbreviation;
  final String? image;
  final Country country;

  StateModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.abbreviation,
    this.image,
    required this.country,
  });

  factory StateModel.fromMap(Map<String, dynamic> map) {
    return StateModel(
      id: map['id'] ?? -1,
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
      abbreviation: map['abbreviation'] ?? '',
      image: map['image'],
      country: Country.fromMap(map['country'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'abbreviation': abbreviation,
      'image': image,
      'country': country.toMap(),
    };
  }

  factory StateModel.initial() =>
      StateModel(
        id: -1,
        name: '',
        slug: '',
        abbreviation: '',
        country: Country.initial(),
      );
}