import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart' hide FormBuilder;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_commons/mobile_commons.dart';

import '../../entities/pet.dart';
import 'controllers/home_controller.dart';

class RegisterPet extends StatelessWidget {
  RegisterPet({super.key});

  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      title: Text('Novo pet', style: Theme.of(context).textTheme.titleLarge),
      content: FormBuilder(
        key: homeController.form.key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FormInput(
              name: 'name',
              label: 'Nome',
            ),
            const SizedBox(height: 12),
            const FormInput(name: 'age', keyboardType: TextInputType.number, label: 'Idade'),
            const SizedBox(height: 12),
            FormBuilderDropdown<String>(
              name: 'gender',
              decoration: const InputDecoration(labelText: 'Gênero', border: OutlineInputBorder()),
              items: Gender.values.map((e) => DropdownMenuItem(value: e.value, child: Text(e.value))).toList(),
            ),
          ],
        ),
      ),
      actions: [
        Button.text(onPressed: Modular.to.pop, text: 'Cancelar'),
        Button.filled(
          text: 'Salvar',
          onPressed: () {
            homeController.savePet();
            Modular.to.pop();
          },
        ),
      ],
    );
  }
}
