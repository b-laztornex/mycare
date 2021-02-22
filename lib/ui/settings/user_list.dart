import 'package:flutter/material.dart';

import 'package:mycare_archive/config/database.dart';
import 'package:mycare_archive/model/user_model.dart';

class UserList extends StatefulWidget {
  final color;
  final child;
  const UserList({
    Key key,
    this.color = const Color(0xFF2DBD3A),
    this.child,
  }) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<UserModel> _user;

  @override
  void initState() {
    super.initState();

    DatabaseUtils du = new DatabaseUtils();

    du.getUsers().then((val) {
      setState(() {
        _user = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<int> colorCodes = <int>[600, 500, 400, 300, 200];
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Selection object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("UserList"),
      ),
      body: _user != null
          ? ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _user.length,
              itemBuilder: (BuildContext context, int index) {
                UserModel user = _user[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/patient_show',
                      arguments: user,
                    );
                  },
                  child: Container(
                    height: 50,
                    color: Colors.amber[colorCodes[index]],
                    child: Center(child: Text('${_user[index].name}')),
                  ),
                );
              })
          : CircularProgressIndicator(),
    );
  }
}
//_user[index].id.toString(),
