import 'package:flutter/material.dart';
import 'package:mycare_archive/config/constant.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key key,
    this.color = const Color(0xFF2DBD3A),
    this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Selection object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Settings"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 3,
          // Generate 100 widgets that display their index in the List.
          children: AppConstants()
              .settings
              .map((setting) => GestureDetector(
                  onTap: () {
                    // Navigate to the second screen using a named route.
                    print(setting.toLowerCase().split(' ')[0]);
                    Navigator.pushNamed(
                        context, '/${setting.toLowerCase().split(' ')[1]}');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.green, spreadRadius: 3),
                          ],
                        ),
                        child: Column(
                          children: [
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  '$setting',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
