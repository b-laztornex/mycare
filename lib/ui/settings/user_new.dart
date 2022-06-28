import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:care_archives/config/constant.dart';
import 'package:care_archives/ui/shared/input_decoration.dart';
import 'package:care_archives/ui/shared/dropdown.dart';
import 'package:care_archives/config/database.dart';
import 'package:care_archives/model/user_model.dart';

// Define a custom Form widget.
class UserNew extends StatefulWidget {
  @override
  _UserNewState createState() => _UserNewState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _UserNewState extends State<UserNew> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();
  final avatarController = TextEditingController();
  final birthdayController = TextEditingController();
  final conditionController = TextEditingController();
  final representativeController = TextEditingController();
  final kinController = TextEditingController();
  final surgeryController = TextEditingController();
  final gpController = TextEditingController();
  late List<UserModel> _users;
  var finaldate;
  DateTime selectedDate = DateTime.now();

  DatabaseUtils uc = new DatabaseUtils();

  @override
  void initState() {
    super.initState();

    uc.getUsers().then((value) {
      setState(() {
        _users = value!;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    avatarController.dispose();
    birthdayController.dispose();
    conditionController.dispose();
    representativeController.dispose();
    kinController.dispose();
    surgeryController.dispose();
    gpController.dispose();
    super.dispose();
  }

  /*void callDatePicker() async {
    var order = await getDate();
    setState(() {
      finaldate = order;
      birthdayController.text = DateFormat.yMMMd().format(order).toString();
    });
  }*/

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new patient'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                controller: nameController,
                decoration: inputDecorationForm('Full Name')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: birthdayController,
              decoration: InputDecoration(
                hintText: "Enter Birthday",
                suffixIcon: IconButton(
                  onPressed: _selectDate(context),
                  icon: Icon(Icons.calendar_today),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                maxLines: 3,
                controller: conditionController,
                decoration: inputDecorationForm('Condition')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                maxLines: 3,
                controller: representativeController,
                decoration: inputDecorationForm('Representative')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                maxLines: 3,
                controller: kinController,
                decoration: inputDecorationForm('Next of kin + Phone + Email')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                maxLines: 3,
                controller: surgeryController,
                decoration:
                    inputDecorationForm('Surgery name + Address + Phone')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                controller: gpController,
                decoration: inputDecorationForm('GP Name')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: Text('SAVE'),
                onPressed: () {
                  UserModel newUser = UserModel(
                    nameController.text,
                    'patient',
                    'avatar_default',
                    birthdayController.text,
                    conditionController.text,
                    representativeController.text,
                    kinController.text,
                    surgeryController.text,
                    gpController.text,
                    0,
                  );

                  uc.insertUser(newUser).then((val) {
                    Navigator.pushNamed(context, '/home');
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
