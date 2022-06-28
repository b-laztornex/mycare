import 'package:flutter/material.dart';

class DropdownForm extends StatefulWidget {
  final String title;
  final List<String> types;
  DropdownForm({Key? key, required this.title, required this.types})
      : super(key: key);

  @override
  _DropdownFormState createState() => _DropdownFormState();
}

class _DropdownFormState extends State<DropdownForm> {
  late String _dropdownValue;

  @override
  void initState() {
    super.initState();
    setState(() {
      _dropdownValue = widget.title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _dropdownValue,
      isExpanded: true,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          _dropdownValue = newValue!;
        });
      },
      items: widget.types.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
