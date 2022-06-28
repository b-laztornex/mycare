import 'package:flutter/material.dart';
import 'package:care_archives/ui/categories/sleep/sleep_constant.dart';
import 'package:care_archives/ui/shared/checkbox.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({Key? key}) : super(key: key);

  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  bool _isSelected = false;
  List<String> _checkedList = [];
  List<String> _stateList = AppConstants().sleepStates;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'titke',
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the Selection object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Sleep"),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _stateList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: LabeledCheckbox(
                label: _stateList[index],
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                value: _checkedList.contains(_stateList[index]),
                onChanged: (bool newValue) {
                  if (newValue) {
                    _checkedList.add(_stateList[index]);
                  } else {
                    _checkedList
                        .removeWhere((item) => item == _stateList[index]);
                  }

                  setState(() {
                    _checkedList = _checkedList;
                  });
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/activity',
                arguments: _checkedList.join(','));
          },
          tooltip: 'New Activity',
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
