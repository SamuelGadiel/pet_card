import 'package:flutter/material.dart';
import 'package:mobile_commons/mobile_commons.dart';

import '../../../../configs/cache_keys.dart';
import '../../../entities/pet.dart';
import 'home_store.dart';

class HomeController extends ChangeNotifier with HomeStore {
  final CacheServiceImplementation cache;

  HomeController(this.cache);

  void getPet() {
    if (cache.hasDataInKey(CacheKeys.pet)) {
      pet = Pet.fromJson(cache.get(CacheKeys.pet));
    }

    pet = null;

    notifyListeners();
  }

  void savePet() {
    if (form.validate()) {
      cache.set(CacheKeys.pet, form.values);

      pet = Pet.fromJson(form.values);

      notifyListeners();
    }
  }
}
