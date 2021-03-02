// Classe de usuário

import 'package:flutter/cupertino.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String avatarurl;
  final String profissao;

  // criando constructor
  const User({
    this.id,
    // required é para criar um usuário do 0
    @required this.name,
    @required this.email,
    @required this.avatarurl,
    @required this.profissao,
  });
}
