import 'package:flutter/material.dart';
import 'package:projeto_crud/models/user.dart';
import 'package:projeto_crud/routes/app_routes.dart';
// Aqui vamos criar os componentes onde vamos armanzenar avatar etc

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    // Se o usuário tiver avatar igual a nullo ou vázio
    final avatar = user.avatarurl == null || user.avatarurl.isEmpty
        // Adicione o ícone da person
        ? CircleAvatar(
            child: Icon(Icons.person),
          )
        // else
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarurl));
    return ListTile(
        //avatar,
        leading: avatar,
        title: Text(user.name),
        subtitle: Text(user.email),
        // Botões de editar e deletar
        trailing: Container(
            width: 100,
            child: Row(children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                color: Colors.green[200],
                onPressed: () {
                  // Aqui dentro vou chamar a view e o usuário como argumento
                  Navigator.of(context).pushNamed(
                    AppRoutes.USER_FORM, 
                    arguments: user, 
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {},
              ),
            ])));
  }
}
