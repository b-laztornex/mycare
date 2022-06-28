import 'package:flutter/material.dart';
import 'package:care_archives/model/user_model.dart';
import 'package:care_archives/config/database.dart';

class UserShow extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.
  final UserModel data;

  UserShow({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Selection object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("UserShow"),
      ),
      body: data != null
          ? Column(
              children: [
                Text('Name:'),
                Text(data.name),
                Text('Condition'),
                Text(data.condition),
                Text('Kin'),
                Text(data.kin),
                Text('Role'),
                Text(data.role),
                Text('Representative'),
                Text(data.representative),
                Text('GP'),
                Text(data.gp),
              ],
            )
          : Text('No user found'),
    );
  }
}
