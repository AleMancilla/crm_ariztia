import 'package:ariztia_crm/core/widgets/button_ariztia.dart';
import 'package:ariztia_crm/core/widgets/text_field_ariztia.dart';
import 'package:ariztia_crm/login/presentation/widgets/input_text_field_personalized.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController controllerUser = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/ariztia_logo.png',
              width: 450,
            ),
            Container(
              width: 300,
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  InputTextFieldPersonalized('Usuario', controllerUser),
                  const SizedBox(height: 20),
                  InputTextFieldPersonalized('Contraseña', controllerPass),
                  const SizedBox(height: 20),
                  ButtonAriztia(
                      text: 'Iniciar Session',
                      onpress: () {
                        print('online,,.... ');
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
