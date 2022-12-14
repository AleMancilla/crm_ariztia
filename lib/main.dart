import 'package:ariztia_crm/core/UserPreferens.dart';
import 'package:ariztia_crm/crm_ariztia/presentation/bloc/business_bloc/business_bloc.dart';
import 'package:ariztia_crm/crm_ariztia/presentation/bloc/orders_bloc/orders_bloc.dart';
import 'package:ariztia_crm/crm_ariztia/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:ariztia_crm/firebase_options.dart';
import 'package:ariztia_crm/crm_ariztia/presentation/pages/home_page.dart';
import 'package:ariztia_crm/login/presentation/page/login_screen.dart';
import 'package:ariztia_crm/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPreferences();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      child: MyApp(),
      providers: [
        // BlocProvider<CategoryBloc>(create: (_) => CategoryBloc()),
        BlocProvider<ProductsBloc>(create: (_) => ProductsBloc()),
        // BlocProvider<ShopBloc>(create: (_) => ShopBloc()),
        BlocProvider<BusinessBloc>(create: (_) => BusinessBloc()),
        BlocProvider<OrdersBloc>(create: (_) => OrdersBloc()),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ariztia CRM',
      // routes: {
      //   'login': (context) => LoginScreen(),
      //   'homePage': (context) => HomePage(),
      //   'splash': (context) => SplashScreen(),
      //   // 'home_screen': (context) => const MenuScreen(),
      // },
      // initialRoute: 'splash',
      home: SplashScreen(),
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
