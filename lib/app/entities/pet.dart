import 'package:mobile_commons/mobile_commons.dart';

class Pet {
  final String name;
  final String? age;
  final Gender gender;
  final String? breed;

  Pet({
    required this.name,
    required this.age,
    required this.gender,
    required this.breed,
  });

  factory Pet.fromJson(Json json) {
    return Pet(
      name: json['name'],
      age: json['age'],
      gender: Gender.values.firstWhere((gender) => gender.value == json['gender']),
      breed: json['breed'],
    );
  }

  Json toJson() {
    return {
      'name': name,
      'age': age,
      'gender': gender.value,
      'breed': breed,
    };
  }
}

enum Gender {
  male('Masculino'),
  female('Feminino');

  final String value;
  const Gender(this.value);
}
