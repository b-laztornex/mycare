import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:mycare_archive/model/activity_model.dart';
import 'package:mycare_archive/config/database.dart';
import 'package:mycare_archive/ui/shared/dropdown.dart';
import 'package:intl/intl.dart';

class SubCategory extends StatelessWidget {
  const SubCategory({
    Key key,
    this.title,
    this.isMedicine = false,
  }) : super(key: key);

  final String title;
  final bool isMedicine;

  insertActivity() {}

  @override
  Widget build(BuildContext context) {
    DatabaseUtils uc = new DatabaseUtils();
    TextEditingController dateController = TextEditingController();
    final now = new DateTime.now();
    String formatter = DateFormat('jm').format(now);
    dateController.text = formatter;

    return Padding(
      padding: EdgeInsets.only(left: 30.0, bottom: 5.0),
      child: RaisedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                elevation: 16,
                child: Container(
                  height: 400.0,
                  width: 460.0,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: Stack(children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: IconButton(
                                  iconSize: 100.0,
                                  icon: Icon(
                                    Icons.watch,
                                    color: Color(0xFF00c2cb),
                                  ),
                                  tooltip: 'Set Date for Start Activity',
                                  onPressed: () {
                                    DatePicker.showTime12hPicker(context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                      String hourFormat =
                                          DateFormat('jm').format(date);
                                      dateController.text = hourFormat;
                                    },
                                        currentTime: DateTime.now(),
                                        locale: LocaleType.en);
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 50.0),
                                  child: Text(
                                    "Edit",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          TextField(
                            controller: dateController,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Time',
                            ),
                          ),
                          isMedicine
                              ? Row(
                                  children: [
                                    Container(
                                      width: 120.0,
                                      child: Text("DOSE"),
                                    ),
                                    Expanded(
                                      child: DropdownForm(
                                        title: "1",
                                        types: ['1', '2', '3', '4', '5', '6'],
                                      ),
                                    )
                                  ],
                                )
                              : Container(),
                          Container(
                            height: 60,
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Color(0xFF00c2cb),
                              child: Text(
                                'Save Entry',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                ActivityModel newActivity = new ActivityModel(
                                  '',
                                  '',
                                  '',
                                  '',
                                  '',
                                );

                                uc.insertActivity(newActivity).then((val) {
                                  print('VAL');
                                  print(val.toString());
                                  Navigator.pushNamed(context, '/home');
                                });
                                Navigator.pushNamed(context, '/home');
                                Navigator.pushNamed(context, '/home');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
              /*Icon(
                Icons.save,
                color: Color(0xFF00c2cb),
              ),
              Icon(
                Icons.watch,
                color: Color(0xFF00c2cb),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
