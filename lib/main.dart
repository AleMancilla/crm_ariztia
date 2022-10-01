import 'package:ariztia_crm/firebase_options.dart';
import 'package:ariztia_crm/login/presentation/page/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ariztia CRM',
      routes: {
        'login': (context) => LoginScreen(),
        // 'home_screen': (context) => const MenuScreen(),
      },
      initialRoute: 'login',
      theme: ThemeData(
        // Define the default brightness and colors.
        // brightness: Brightness.dark,
        primaryColor: Colors.red[900],

        // Define the default font family.
        // fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        // textTheme: const TextTheme(
        //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        // ),
      ),
    );
  }
}
