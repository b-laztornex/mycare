import 'package:flutter/material.dart';
import 'package:mycare_archive/ui/home/subcategory.dart';
import 'package:mycare_archive/config/database.dart';

// Define a custom Form widget.
class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _CategoriesState extends State<Categories> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  DatabaseUtils uc = new DatabaseUtils();
  double _quantity = 0.0;
  double _pain = 0.0;
  RangeValues _range = RangeValues(4.0, 6.0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  Widget expansionTileTitle(String title) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.teal,
        ),
      ),
    );
  }

  Widget pain() {
    return Column(
      children: <Widget>[
        Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Slider(
              value: _pain,
              onChanged: (newQuantity) {
                setState(() => _pain = newQuantity);
              },
              divisions: 10,
              min: 0,
              max: 10,
              label: "$_pain",
            ),
          ),
        ),
        Center(
          child: Text("${_pain.toStringAsFixed(0)}"),
        ),
        RaisedButton(
          textColor: Colors.white,
          color: Color(0xFF00c2cb),
          child: Text(
            'Save Entry',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            //insertActivity();
          },
        ),
      ],
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
              divisions: 20,
              min: 0,
              max: 400,
              label: "$_quantity",
            ),
          ),
        ),
        Center(
          child: Text("${_quantity.toStringAsFixed(0)} ML"),
        ),
        RaisedButton(
          textColor: Colors.white,
          color: Color(0xFF00c2cb),
          child: Text(
            'Save Entry',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpansionTile(
          title: expansionTileTitle("SLEEP"),
          children: <Widget>[
            SubCategory(title: 'SLEEP REGISTRATION'),
          ],
        ),
        ExpansionTile(
          title: expansionTileTitle("NUTRITION"),
          children: <Widget>[
            SubCategory(title: 'SNACK'),
            SubCategory(title: 'MEAL'),
            SubCategory(title: 'PUDDING'),
          ],
        ),
        ExpansionTile(
          title: expansionTileTitle("HYDRATION"),
          children: <Widget>[
            hydration(),
          ],
        ),
        ExpansionTile(
          title: expansionTileTitle("INCIDENT"),
          children: <Widget>[
            SubCategory(title: 'FALL'),
            SubCategory(title: 'VOMIT'),
            SubCategory(title: 'WOUND'),
            SubCategory(title: 'LOSS OF CONSCIOUSNESS'),
            SubCategory(title: 'STROKE'),
            SubCategory(title: 'FRACTURE'),
            SubCategory(title: 'AGGRESSION'),
            SubCategory(title: 'BODY'),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: ExpansionTile(
                title: expansionTileTitle("OTHER"),
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Incident",
                      icon: Icon(Icons.assignment),
                    ),
                    maxLines: 5,
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Color(0xFF00c2cb),
                    child: Text(
                      'Save Entry',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        ExpansionTile(
          title: expansionTileTitle("MEDICATION"),
          children: <Widget>[
            SubCategory(title: 'PARACETAMOL 500mg TAB', isMedicine: true),
            SubCategory(title: 'PARACETAMOL 250mg TAB', isMedicine: true),
            SubCategory(title: 'COLYPAN 25mg TAB', isMedicine: true),
            SubCategory(title: 'AMOXICICILYN 250mg TAB', isMedicine: true),
          ],
        ),
        ExpansionTile(
          title: expansionTileTitle("PERSONAL CARE"),
          children: <Widget>[
            SubCategory(title: 'INDEPENDENT'),
            SubCategory(title: 'ASSISTED'),
            SubCategory(title: 'HANDS'),
            SubCategory(title: 'MOUTH'),
            SubCategory(title: 'FACE'),
            SubCategory(title: 'HAIR'),
            SubCategory(title: 'GROIN'),
            SubCategory(title: 'BODY'),
          ],
        ),
        ExpansionTile(
          title: expansionTileTitle("ACTIVITIES"),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: ExpansionTile(
                title: expansionTileTitle("INDOORS"),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: ExpansionTile(
                      title: expansionTileTitle("PERSONAL"),
                      children: <Widget>[
                        SubCategory(title: 'PASIVE'),
                        SubCategory(title: 'ACTIVE'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: ExpansionTile(
                      title: expansionTileTitle("GROUP"),
                      children: <Widget>[
                        SubCategory(title: 'PASIVE'),
                        SubCategory(title: 'ACTIVE'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: ExpansionTile(
                title: expansionTileTitle("OUTDOORS"),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: ExpansionTile(
                      title: expansionTileTitle("PERSONAL"),
                      children: <Widget>[
                        SubCategory(title: 'PASIVE'),
                        SubCategory(title: 'ACTIVE'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: ExpansionTile(
                      title: expansionTileTitle("GROUP"),
                      children: <Widget>[
                        SubCategory(title: 'PASIVE'),
                        SubCategory(title: 'ACTIVE'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: expansionTileTitle("MOOD & BEHAVIOUR"),
          children: <Widget>[
            SubCategory(title: 'AGGRESSION'),
            SubCategory(title: 'ANXIETY'),
            SubCategory(title: 'SADNESS'),
            SubCategory(title: 'DELUSION'),
            SubCategory(title: 'HALLUCINATION'),
            SubCategory(title: 'CONTENTED'),
            SubCategory(title: 'JOYFUL'),
            SubCategory(title: 'ECSTATIC'),
          ],
        ),
        ExpansionTile(
          title: expansionTileTitle("MOBILITY"),
          children: <Widget>[
            SubCategory(title: 'INDEPENDENT'),
            SubCategory(title: 'AIDED BY WALKING STICK'),
            SubCategory(title: 'AIDED BY ZIMMER FRAME'),
            SubCategory(title: 'FURNITURE SURFING'),
            SubCategory(title: 'UNSTEADY'),
          ],
        ),
        ExpansionTile(
          title: expansionTileTitle("SKIN INTEGRITY"),
          children: <Widget>[
            SubCategory(title: 'REDNESS'),
            SubCategory(title: 'ITCHINESS'),
            SubCategory(title: 'ABRATION'),
            SubCategory(title: 'BRUISE'),
            SubCategory(title: 'INFLAMMATION'),
            SubCategory(title: 'WOUND'),
            SubCategory(title: 'DRY'),
            SubCategory(title: 'PRESSURE SORE'),
            SubCategory(title: 'BURNT'),
          ],
        ),
        ExpansionTile(
          title: expansionTileTitle("PAIN MANAGEMENT"),
          children: <Widget>[
            pain(),
          ],
        ),
        ExpansionTile(
          title: expansionTileTitle("CREATE A NOTE"),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Notes",
                icon: Icon(Icons.assignment),
              ),
              maxLines: 5,
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Color(0xFF00c2cb),
              child: Text(
                'Save Entry',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        ),
      ],
    );
  }
}
