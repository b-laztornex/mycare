import 'package:flutter/material.dart';
import 'package:care_archives/model/entry_model.dart';
import 'package:care_archives/model/activity_model.dart';
import 'package:care_archives/ui/shared/input_decoration.dart';

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, this.context);

  final Entry entry;
  final BuildContext context;

  Widget note() {
    return TextField(
      key: UniqueKey(),
      maxLines: 4,
    );
  }

  Widget hydration() {
    return Column(
      children: <Widget>[
        Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Slider(
              value: 3.0,
              onChanged: (value) => print(3),
              min: 0,
              max: 100,
              label: "10",
            ),
          ),
        ),
        Center(
          child: Text("12"),
        ),
      ],
    );
  }

  Widget elemetCategory(Entry root) {
    Widget el = const Text('Category');

    switch (root.type) {
      case 0:
        el = Text(root.title);
        break;
      case 1:
        {
          el = Row(
            children: <Widget>[
              Text(root.title),
              hydration(),
            ],
          );
        }
        break;

      case 2:
        {
          el = Expanded(
            child: Column(
              children: <Widget>[
                Text(root.title),
                Container(
                  height: 100.0,
                  color: Colors.red,
                  child: note(),
                ),
              ],
            ),
          );
        }
        break;
    }

    return el;
  }

  Widget _buildTiles(Entry root, {String title = " "}) {
    if (root.children.isEmpty) {
      final activity = new Activity(title, root.title);
      return Padding(
        padding: EdgeInsets.only(
          left: 40.0,
          right: 40.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 3.0,
                color: Color(0xFFffffff),
              ),
            ),
          ),
          child: ListTile(title: elemetCategory(root), onTap: () {}),
        ),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      backgroundColor: Color(0xffffde59),
      title: Container(
        child: Text(
          root.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Color(0xFF00c2cb),
            ),
          ),
        ),
      ),
      children: root.children.map((child) {
        return _buildTiles(child, title: root.title);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
