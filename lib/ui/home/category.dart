import 'package:flutter/material.dart';
import 'package:care_archives/config/database.dart';
import 'package:care_archives/model/user_model.dart';

// Define a custom Form widget.
class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _CategoryState extends State<Category> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final avatarController = TextEditingController();
  final birthdayController = TextEditingController();
  final diagnoseController = TextEditingController();
  final roleController = TextEditingController();
  final phoneController = TextEditingController();
  final mailController = TextEditingController();
  final addressController = TextEditingController();
  final surgeryController = TextEditingController();
  List<UserModel>? _users;
  var finaldate;

  DatabaseUtils uc = new DatabaseUtils();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    surnameController.dispose();
    avatarController.dispose();
    birthdayController.dispose();
    diagnoseController.dispose();
    roleController.dispose();
    phoneController.dispose();
    mailController.dispose();
    addressController.dispose();
    surgeryController.dispose();
    super.dispose();
  }

  _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpansionTile(
          title: Text("Create"),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "User ID",
                icon: Icon(Icons.face),
              ),
              validator: (val) {},
            )
          ],
        ),
        ExpansionTile(
          title: Text("Create"),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "User ID",
                icon: Icon(Icons.face),
              ),
              validator: (val) {},
            )
          ],
        ),
      ],
    );
  }
}
