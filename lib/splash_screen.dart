import 'package:ariztia_crm/core/UserPreferens.dart';
import 'package:ariztia_crm/core/function_utils.dart';
import 'package:ariztia_crm/core/utils.dart';
import 'package:ariztia_crm/crm_ariztia/presentation/bloc/business_bloc/business_utils.dart';
import 'package:ariztia_crm/crm_ariztia/presentation/pages/home_page.dart';
import 'package:ariztia_crm/login/presentation/page/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final prefs = UserPreferences();
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500), () async {
      if (prefs.userLogin == null || prefs.userLogin == '') {
        navigateToPage(context, LoginScreen());
      } else {
        navigateToPage(context, HomePage());
      }
      await chargeAllBusiness(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = getSizeByContext(context);
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/ariztia_logo.png',
          width: size.width * 0.85,
        ),
      ),
    );
  }
}
