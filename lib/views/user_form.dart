import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

// Formulário de usuário
class UserForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.supervisor_account_sharp),
              onPressed: () {
              //Voltar pra tela anterior
          
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }
}
