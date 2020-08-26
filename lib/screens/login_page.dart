import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adm/adm_home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.3,
            right: 32,
            left: 32,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/hercosul_logo.png'),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  labelText: 'Registro',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.lock),
                    labelText: 'Senha',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Adm_Home.pageRoute);
                      },
                      child: Text(
                        'Entrar ',
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      Text(
                        'Esqueceu sua senha?',
                      ),
                      Text('Clique aqui'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
