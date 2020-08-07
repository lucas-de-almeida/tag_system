import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tag_system/screens/adm/adm_home.dart';
import 'package:tag_system/screens/adm/cadastro.dart';
import 'package:tag_system/screens/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: Adm_Home(),
      routes: {
        Cadastro_Page.pageRoute: (context) => Cadastro_Page(),
      },
    );
  }
}
