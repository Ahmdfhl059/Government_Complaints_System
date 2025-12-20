class Citizen {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  Citizen({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
    };
  }

  // تحويل Map من الـ API إلى مودل
  factory Citizen.fromMap(Map<String, dynamic> map) {
    return Citizen(
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  factory Citizen.initial() => Citizen(
    firstName: '',
    lastName: '',
    email: '',
    phone: '',
  );

  Citizen copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) {
    return Citizen(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}
