import 'package:ariztia_crm/core/UserPreferens.dart';
import 'package:ariztia_crm/core/utils.dart';
import 'package:ariztia_crm/core/widgets/button_ariztia.dart';
import 'package:ariztia_crm/login/data/models/user_login.dart';
import 'package:ariztia_crm/login/data/repositories/read_user_login_firestore_repository_implements.dart';
import 'package:ariztia_crm/login/presentation/page/home_page.dart';
import 'package:ariztia_crm/login/presentation/widgets/input_text_field_personalized.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController controllerUser = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();

  ReadUserLoginRepositoryImplements firebase =
      ReadUserLoginRepositoryImplements();
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
                      onpress: () async {
                        initSesion(context);
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<UserLogin?> chargeUserForLogin() async {
    return await firebase.readUserForLogin(
        controllerUser.text, controllerPass.text);
  }

  Future<void> initSesion(BuildContext context) async {
    bool response = false;
    await loadingAsyncFunction(context, () async {
      response = await chargeUserForLogin() != null;
    });
    if (response) {
      final prefs = UserPreferences();
      navigateToPage(context, HomePage());
      prefs.setUserLogin(controllerUser.text);
    } else {
      print('no existe el usuario');
    }
  }
}
