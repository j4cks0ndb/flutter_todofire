import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todofire/app/modules/home/home_controller.dart';
import 'package:todofire/app/modules/home/models/todo_model.dart';

class ItemTile extends StatelessWidget {
  final TodoModel model;
  final Function onTap;

  const ItemTile({Key key, this.model, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
                title: Text(model.title),
                onTap: onTap,
                leading: IconButton(icon: Icon(Icons.delete_forever),color: Colors.red, onPressed:(){ Modular.get<HomeController>().delete(model);},),
                trailing: Checkbox(
                  value: model.check,
                  onChanged: (check){
                    model.check = check;
                    Modular.get<HomeController>().save(model);
                  },),
             );
  }
}