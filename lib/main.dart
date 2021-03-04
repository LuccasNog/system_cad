import 'package:flutter/material.dart';
import 'package:projeto_crud/routes/app_routes.dart';
import 'package:projeto_crud/views/user_form.dart';
import 'package:projeto_crud/views/user_list.dart';
import 'package:projeto_crud/provider/user.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
      // ChangeNotifierProvider é a lista de usuários, ele cuida da lista de usuários.
       // Posso ter varios provider que é o multiprovider e posso colocar cada um
      return MultiProvider(
            providers: [
               ChangeNotifierProvider(
                  create: (ctx) =>  Users(),
                )
            ],
             child: MaterialApp(
                   title: 'Flutter Demo',
                   theme: ThemeData(  
                          primarySwatch: Colors.amber,
                         visualDensity: VisualDensity.adaptivePlatformDensity,
                   ),
                  // home: UserList(),
                   routes: {
                     AppRoutes.HOME: (_) => UserList(),
                     AppRoutes.USER_FORM: (_) => UserForm()
                   },
             )      
       );
    }    




}
