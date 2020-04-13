import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:todofire/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todofire/app/modules/home/home_page.dart';
import 'package:todofire/app/modules/home/repositories/todo_firebase_repository.dart';
import 'package:todofire/app/modules/home/repositories/todo_repository_interface.dart';

import 'repositories/todo_hasura_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        //Bind<ITodorepository>((i) => TodoFirebaseRepository(Firestore.instance)),
        Bind<ITodorepository>((i) => TodoHasuraRepository(i.get())),
        Bind((i) => HasuraConnect('https://coalatodohasura.herokuapp.com/v1/graphql')),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
