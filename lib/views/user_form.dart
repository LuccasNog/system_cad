import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:projeto_crud/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crud/models/user.dart';

//import 'package:projeto_crud/views/user_list.dart';
// Formulário de usuário
class UserForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Variavel para pegar o formulário para acessar dentro do IconButton onpRESSED
    final _form = GlobalKey<FormState>();
    final Map<String, String> _formData = {};

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                // meotodo save vai salvar PARA CADA UM DOS ELEMENTOS
                _form.currentState.save();
                // METODO PARA VALIDAR
                final isValid = _form.currentState.validate();

                if (isValid) {
                  //Voltar pra tela anterior
                  // Aqui aonde vai salvar o usuário no provider
                  Provider.of<Users>(context, listen: false).put(User(
                      // extancisando o usuário
                        id: _formData['id'],
                        name: _formData['name'],
                        email: _formData['email'],
                        avatarurl: _formData['avatarurl'],
                        profissao: _formData['profissao'],
                     ),
                     
                  );

                  Navigator.of(context).pop();
                }
              }),
        ],
      ),
      // Formulário não ficará grudado na tela vams utilizar Padding
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          // Associando a variavel _form ao formulário
          key: _form,
          // COlocando os campos dentro de uma coluna
          child: Column(
            children: <Widget>[
              TextFormField(
                // Colocando decoração
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) => _formData['name'] = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome é invalido';
                  }

                  if (value.trim().length < 3) {
                    return 'Nome é curto';
                  }

                  return null;
                },
              ),
              TextFormField(
                // Colocando decoração
                decoration: InputDecoration(labelText: 'E-mail do usuário'),
                onSaved: (value) => _formData['email'] = value,
                // metodo save que é mencionado Onpressed
              ),
              TextFormField(
                onSaved: (value) => _formData['avatarurl'] = value,
                // Colocando decoração
                decoration: InputDecoration(labelText: 'URL do Avatar'),
              ),
              TextFormField(
                onSaved: (value) => _formData['profissao'] = value,
                // Colocando decoração
                decoration: InputDecoration(labelText: 'profissao'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
