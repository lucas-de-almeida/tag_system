import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tag_system/screens/adm/adm_home.dart';
import 'package:tag_system/screens/adm/cadastro.dart';
import 'package:tag_system/screens/login_page.dart';
import 'package:splashscreen/splashscreen.dart';
import 'screens/adm/adm_home.dart';
import 'screens/adm/adm_home.dart';
import 'screens/login_page.dart';
import 'screens/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        seconds: 5,
        image: Image.asset('assets/images/hercosul_logo.png'),
        navigateAfterSeconds: LoginPage(),
        photoSize: 150,
      ),
      routes: {
        Cadastro_Page.pageRoute: (context) => Cadastro_Page(),
        Adm_Home.pageRoute: (context) => Adm_Home(),
      },
    );
  }
}
