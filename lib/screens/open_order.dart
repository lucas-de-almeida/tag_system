import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OpenOrder extends StatefulWidget {
  @override
  _OpenOrderState createState() => _OpenOrderState();
}

class _OpenOrderState extends State<OpenOrder> {
  var now = new DateTime.now();
  final formatter = new DateFormat('dd-MM-yyyy hh:mm');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Cadastro de usuario'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.white,
                child: Text(
                  formatter.format(now),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Expanded(
                child: Form(
                  child: Column(
                    children: <Widget>[
                      campoEntrada('Nome Completo'),
                      campoEntrada('Registro'),
                      campoEntrada('Cpf'),
                      campoEntrada('Email'),
                      campoEntrada('telefone'),
                      campoEntrada('Turno'),
                      campoEntrada('Data Nascimento'),
                      campoEntrada('Area de Trabalho')
                    ],
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('cancelar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField campoEntrada(String texto) {
    return TextFormField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(),
        ),
        labelText: texto,
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
