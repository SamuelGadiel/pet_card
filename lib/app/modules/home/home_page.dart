import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile_commons/mobile_commons.dart';

import 'controllers/home_controller.dart';
import 'register_pet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();

    homeController.getPet();
  }

  void _registerPet() {
    showDialog(
      context: context,
      builder: (context) => RegisterPet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: homeController,
        builder: (context, child) {
          if (homeController.pet == null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Bootstrap.cup_hot,
                    size: 56,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  Text('Nenhum pet cadastrado ainda', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 56),
                  SizedBox(
                    width: 200,
                    child: Button.filled(
                      onPressed: _registerPet,
                      text: 'Cadastrar',
                    ),
                  ),
                ],
              ),
            );
          }

          return Text(homeController.pet!.name);
        },
      ),
    );
  }
}
