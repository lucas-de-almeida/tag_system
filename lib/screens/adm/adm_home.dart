import 'package:flutter/material.dart';
import 'package:tag_system/screens/adm/cadastro.dart';

class Adm_Home extends StatefulWidget {
  @override
  _Adm_HomeState createState() => _Adm_HomeState();
}

class _Adm_HomeState extends State<Adm_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            Container(
              color: Theme.of(context).buttonColor,
              child: FlatButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(Cadastro_Page.pageRoute),
                child: Text('Página de Cadastros'),
              ),
            ),
            Container(
              color: Colors.red,
              child: FlatButton(
                onPressed: () {},
                child: Text('Teste'),
              ),
            ),
            Container(
              color: Colors.amber,
              child: FlatButton(
                onPressed: () {},
                child: Text('Abrir Ordem de Serviço'),
              ),
            ),
            Container(
              color: Colors.orange,
              child: FlatButton(
                onPressed: () {},
                child: Text('Teste'),
              ),
            ),
            Container(
              color: Colors.brown,
              child: FlatButton(
                onPressed: () {},
                child: Text('Teste'),
              ),
            ),
            Container(
              color: Colors.teal,
              child: FlatButton(
                onPressed: () {},
                child: Text('Teste'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
