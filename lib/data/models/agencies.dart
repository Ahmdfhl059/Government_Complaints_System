class Agency {
  final int id;
  final String name;
  final String code;
  final String description;
  final String logo;
  final String website;
  final String email;
  final String phone;
  final String address;
  final City city;

  Agency({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    required this.logo,
    required this.website,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
  });

  factory Agency.fromMap(Map<String, dynamic> map) {
    return Agency(
      id: map['id'] ?? -1,
      name: map['name'] ?? '',
      code: map['code'] ?? '',
      description: map['description'] ?? '',
      logo: map['logo'] ?? '',
      website: map['website'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      city: City.fromMap(map['city'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'description': description,
      'logo': logo,
      'website': website,
      'email': email,
      'phone': phone,
      'address': address,
      'city': city.toMap(),
    };
  }

  factory Agency.initial() => Agency(
    id: -1,
    name: '',
    code: '',
    description: '',
    logo: '',
    website: '',
    email: '',
    phone: '',
    address: '',
    city: City.initial(),
  );
}
class City {
  final int id;
  final String name;
  final String slug;
  final String? image;
  final String? zipCode;
  final StateModel state;

  City({
    required this.id,
    required this.name,
    required this.slug,
    this.image,
    this.zipCode,
    required this.state,
  });

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
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

  factory City.initial() =>
      City(
        id: -1,
        name: '',
        slug: '',
        state: StateModel.initial(),
      );
}
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
class Country {
  final int id;
  final String name;
  final String nationality;
  final String code;
  final String? image;

  Country({
    required this.id,
    required this.name,
    required this.nationality,
    required this.code,
    this.image,
  });

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      id: map['id'] ?? -1,
      name: map['name'] ?? '',
      nationality: map['nationality'] ?? '',
      code: map['code'] ?? '',
      image: map['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nationality': nationality,
      'code': code,
      'image': image,
    };
  }

  factory Country.initial() =>
      Country(id: -1, name: '', nationality: '', code: '');
}
