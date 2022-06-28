import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:care_archives/model/activity_model.dart';

class ActivityList extends StatefulWidget {
  final Activity activity;
  const ActivityList({Key? key, required this.activity}) : super(key: key);

  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    String currentDate =
        new DateFormat.yMMMd().format(new DateTime.now()).toString();
    String currentTime =
        new DateFormat.Hm().format(new DateTime.now()).toString();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Write object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Activity List"),
      ),
      body: ListView(
        children: [
          DataTable(
            columns: [
              DataColumn(label: Text('Time')),
              DataColumn(label: Text('Patient')),
              DataColumn(label: Text('Category')),
              DataColumn(label: Text('Desc')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('06:00')),
                DataCell(Text('John')),
                DataCell(Text('SNACK')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('08:00')),
                DataCell(Text('John')),
                DataCell(Text('SNACK')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('09:15')),
                DataCell(Text('John')),
                DataCell(Text('Colypan')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('10:00')),
                DataCell(Text('John')),
                DataCell(Text('HANDS')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('12:00')),
                DataCell(Text('Martha')),
                DataCell(Text('PERSONAL')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('14:00')),
                DataCell(Text('Smith')),
                DataCell(Text('SADNESS')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('15:00')),
                DataCell(Text('Martha')),
                DataCell(Text('INDEPENDENT')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('16:00')),
                DataCell(Text('Martha')),
                DataCell(Text('ABRATION')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('17:00')),
                DataCell(Text('Martha')),
                DataCell(Text('BRUISE')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('17:00')),
                DataCell(Text('Martha')),
                DataCell(Text('MEAL')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('18:00')),
                DataCell(Text('Martha')),
                DataCell(Text('BRUISE')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('19:00')),
                DataCell(Text('Martha')),
                DataCell(Text('OUTDOORS')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('20:00')),
                DataCell(Text('Martha')),
                DataCell(Text('BRUISE')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('21:00')),
                DataCell(Text('Martha')),
                DataCell(Text('SLEEP')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('21:20')),
                DataCell(Text('John')),
                DataCell(Text('SLEEP')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('21:30')),
                DataCell(Text('Smith')),
                DataCell(Text('SLEEP')),
                DataCell(Text('')),
              ]),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/',
          );
        },
        tooltip: 'Save Task',
        child: Icon(Icons.save),
      ),
    );
  }
}
