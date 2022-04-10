import 'package:flutter/material.dart';
import 'package:mycare_archive/config/constant.dart';
import 'package:mycare_archive/ui/shared/input_decoration.dart';
import 'package:mycare_archive/ui/shared/dropdown.dart';
import 'package:mycare_archive/config/database.dart';
import 'package:mycare_archive/model/medicine_model.dart';

// Define a custom Form widget.
class MedicineNew extends StatefulWidget {
  @override
  _MedicineNewState createState() => _MedicineNewState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MedicineNewState extends State<MedicineNew> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final doseController = TextEditingController();
  List<MedicineModel> _medicine;
  double _quantity = 0.0;

  DatabaseUtils uc = new DatabaseUtils();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    descriptionController.dispose();
    doseController.dispose();
    super.dispose();
  }

  Widget quantity() {
    return Column(
      children: <Widget>[
        Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Slider(
              value: _quantity,
              onChanged: (newQuantity) {
                setState(() => _quantity = newQuantity);
              },
              min: 0,
              max: 1000,
              divisions: 200,
              label: _quantity.toStringAsFixed(0),
            ),
          ),
        ),
        Center(
          child: Text(_quantity.toStringAsFixed(0)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Medicine'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                controller: nameController,
                decoration: inputDecorationForm('Medication Name')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                maxLines: 4,
                controller: doseController,
                decoration: inputDecorationForm('Dose')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                maxLines: 4,
                controller: descriptionController,
                decoration: inputDecorationForm('Description')),
          ),
          /*Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownForm(
                title: 'PAINKILLERS', types: AppConstants.medicationTypes),
          ),*/
          /*Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownForm(
                title: 'TABLET', types: AppConstants.medicationAdminister),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: quantity(),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownForm(
                title: 'MILIGRAM', types: AppConstants.medicationMetric),
          ),*/
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
                  MedicineModel newMedicine = new MedicineModel(
                    nameController.text,
                    '',
                    doseController.text,
                    descriptionController.text,
                    '',
                    '',
                    '',
                    '',
                  );

                  uc.insertMedicine(newMedicine).then((val) {
                    print('VAL');
                    print(val.toString());
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
