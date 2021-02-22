import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class PopupMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PopupMenuState();
}

class _PopupMenuState extends State {
  String choice = "Click Settings to make your selection";
  List<String> patientList = ["Martha", "Lewis", "Melort"];
  String _selectedPatient = "Martha";

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (String value) {
        setState(() {
          //print the selected option
          _selectedPatient = value;

          //Update the current choice.
        });
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "$_selectedPatient",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ),
      itemBuilder: (BuildContext context) {
        return patientList.map((link) {
          return PopupMenuItem(
            value: link,
            child: Text("$link"),
          );
        }).toList();
      },
    );
  }
}
