// Vamos controlar o map de usuário por aqui  == notifilister
// exclusão, editar e etc
// Programação observer native
import 'package:flutter/material.dart';
import 'package:projeto_crud/models/user.dart';
import 'package:projeto_crud/data/dummy_user.dart';
import 'dart:math';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USER};

  // METODO QUE VAI RETORNAR A LISTA DE USUÁRIOS OU SEJA UM CLONE DA LISTA
  // Se ocorrer alguma exclusão ou cadastro, vamos chamar esse metodo
  List<User> get all {
    return [..._items.values];
  }

  // quantos elementos tem da lista
  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  // PUT INSERE QUANDO O ELEMENTO NÃO EXISTE  // Alterar
  // FUNCAO PARA INCLUIR
  void put(User user) {
    if (User == Null) {
      return;
    }

    // Verificando se vamos adicionar ou alterar
    if (user.id != null &&
        !user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {


         _items.update(user.id, (_) => User(
            id: user.id,
            name: user.name,
            email: user.email,
            profissao: user.profissao,
            avatarurl: user.avatarurl,
         ));
    }

    else{
      // Criando id de forma random
          final id = Random().nextDouble().toString();

          //Adicionar
          _items.putIfAbsent(
              id,
              () => User(
                    id: id,
                    name: user.name,
                    email: user.email,
                    profissao: user.profissao,
                    avatarurl: user.avatarurl,
                  ));
        }

        notifyListeners(); // alterar a interface gráfica quando houver mudança
        // Acessando a classe User dentro do user Lister que é na VIEW
    }

    // METODE PARA REMOVER
    void remove(User user){
       if(user != null && user.id != null){
         _items.remove(user.id);
         notifyListeners();
       }
    }
}
