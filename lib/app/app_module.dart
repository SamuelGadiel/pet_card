import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_commons/mobile_commons.dart';

import 'modules/home/controllers/home_controller.dart';
import 'modules/home/home_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(CacheServiceImplementation.new);
    i.addLazySingleton(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
  }
}
