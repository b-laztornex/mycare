import 'package:flutter/material.dart';
import 'package:mycare_archive/model/activity_model.dart';
import 'package:mycare_archive/ui/shared/input_decoration.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ActivityPage extends StatefulWidget {
  final Activity activity;
  const ActivityPage({Key key, this.activity}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  double _quantity = 0.0;
  RangeValues _range = RangeValues(4.0, 6.0);

  Widget note() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: TextField(
          maxLines: 8,
          controller: noteController,
          decoration: inputDecorationForm('Notes'),
        ),
      ),
    );
  }

  Widget hydration() {
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
              max: 100,
              label: "$_quantity",
            ),
          ),
        ),
        Center(
          child: Text("$_quantity"),
        ),
      ],
    );
  }

  Widget pain() {
    return Column(
      children: <Widget>[
        Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: RangeSlider(
              values: _range,
              onChanged: (RangeValues newRange) {
                setState(() => _range = newRange);
              },
              min: 0.0,
              max: 10.0,
              divisions: 10,
            ),
          ),
        ),
        Center(
          child: Text("${_range.start} - ${_range.end}"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    dayController.text = now.toString();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Write object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Activity"),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: dayController,
                      enabled: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    tooltip: 'Set Date for Start Activity',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: dateController,
                      enabled: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    tooltip: 'Set Date for Start Activity',
                    onPressed: () {
                      DatePicker.showTime12hPicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        dateController.text = date.toString();
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('${now.day}.${now.month}.${now.year}'),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('${now.hour} : ${now.minute}'),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Category: ${widget.activity.category}'),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Sub-Category: : ${widget.activity.subcategory}'),
            ),
          ),
          if (widget.activity.subcategory == "HYDRATION") hydration(),
          if (widget.activity.subcategory == "PAIN MANAGEMENT") pain(),
          if (widget.activity.subcategory == "NOTES") note(),
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
