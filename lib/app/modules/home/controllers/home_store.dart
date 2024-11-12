import 'package:mobile_commons/mobile_commons.dart';

import '../../../entities/pet.dart';

mixin HomeStore {
  Pet? pet;

  final form = FormController();
}
