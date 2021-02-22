import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mycare_archive/config/constant.dart';
import 'package:mycare_archive/ui/shared/input_decoration.dart';
import 'package:mycare_archive/ui/shared/dropdown.dart';
import 'package:mycare_archive/config/database.dart';
import 'package:mycare_archive/model/user_model.dart';

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
  List<UserModel> _users;
  var finaldate;

  DatabaseUtils uc = new DatabaseUtils();

  @override
  void initState() {
    super.initState();

    uc.getUsers().then((value) {
      setState(() {
        _users = value;
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

  void callDatePicker() async {
    var order = await getDate();
    setState(() {
      finaldate = order;
      birthdayController.text = DateFormat.yMMMd().format(order).toString();
    });
  }

  Future<DateTime> getDate() {
    // Imagine that this function is
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
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
                  onPressed: callDatePicker,
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
                  UserModel newUser = new UserModel(
                    nameController.text,
                    'patient',
                    'avatar_default',
                    birthdayController.text,
                    conditionController.text,
                    representativeController.text,
                    kinController.text,
                    surgeryController.text,
                    gpController.text,
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
