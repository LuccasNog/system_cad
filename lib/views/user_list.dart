// Tela que vai mostrar a lista de usuário
import 'package:flutter/material.dart';
//import 'package:projeto_crud/data/dummy_user.dart';
import 'package:projeto_crud/components/user_tile.dart';
//import 'package:projeto_crud/models/user.dart';
import 'package:projeto_crud/provider/user.dart';
import 'package:projeto_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Adicioando a lista
    final Users users = Provider.of(context);

    // Quando é tela vamos colocar Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de funcionários'),
        // COlocando um botão no bar
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Aqui dentro vou chamar a view User_form.dart
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
          ),
        ],
      ),
      // Mostrar os itens da tela
      body: ListView.builder(
        // Quantos itens tem na lista, isso vem do provider
        itemCount: users.count,
        //Item Builder cria um componente
        itemBuilder: (contexto, indice) => UserTile(users.byIndex(indice)),
      ),
    );
  }
}
