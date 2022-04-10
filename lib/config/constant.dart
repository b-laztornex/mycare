import 'package:mycare_archive/model/entry_model.dart';

class AppConstants {
  List<String> categories = [
    "SLEEP PATTERN",
    "NUTRITION", // pasta
    "HYDRATION", // vaso con leche
    "MEDICATION",
    "PERSONAL CARE",
    "SOCIAL ACTIVITIES", //arbol y sol
    "MOOD & BEHAVIOUR",
    "MOBILITY",
    "SKIN INTEGRITY",
    "PAIN MANAGEMENT ",
    "NOTES",
  ];

  static List<String> medicationMetric = [
    "MILIGRAM",
    "MILLILITRE",
    "KILOGRAM",
    "LITRE",
  ];

  static List<String> medicationAdminister = [
    "TABLET",
    "SYRUP",
    "INJECTED",
  ];

  static List<String> medicationTypes = [
    "PAINKILLERS",
    "ANTACIDS AND ANTIULCERS",
    "ANTI-ALLERGENIC",
    "ANTIDIARRHEALS AND LAXATIVES",
    "ANTIBIOTICS",
    "ANTI-INFLAMMATORY",
    "ANTIPYRETICS",
    "ANTITUSSIVES AND MUCOLYTICS"
  ];

  List<String> settings = [
    "Add Patient",
    "List Patients",
    "Add Medicine",
    "List Medicines",
    "List Activities"
  ];

  static List<String> roles = [
    "CARER",
    "GP",
    "PATIENT",
    "REPRESENTATIVE",
  ];

  static List<String> patientList = [
    "MARTHA",
    "HENRY",
    "PRINCE",
    "REINOLD",
  ];
}

final String initDb = '''CREATE TABLE "users" (
        "id"	INTEGER NOT NULL UNIQUE,
        "name"	TEXT,
        "role"	TEXT,
        "avatar"	TEXT,
        "birthday"	TEXT,
        "condition"	TEXT,
        "representative"	TEXT,
        "kin"	TEXT,
        "surgery"	TEXT,
        "gp"	TEXT,
        PRIMARY KEY("id" AUTOINCREMENT)
        );
        CREATE TABLE "activities" (
        "id"	INTEGER NOT NULL UNIQUE,
        "category"	TEXT,
        "subcategory"	TEXT,
        "description"	TEXT,
        "date"	TEXT,
        "user_id"	INTEGER,
        PRIMARY KEY("id" AUTOINCREMENT));
        CREATE TABLE "medicines" (
        "id"	INTEGER NOT NULL UNIQUE,
        "name"	TEXT NOT NULL,
        "type"	TEXT,
        "description"	TEXT,
        "dose"	TEXT,
        "quantity"	TEXT,
        "metric"	TEXT,
        "administer"	TEXT,
        "frequency"	TEXT,
        PRIMARY KEY("id" AUTOINCREMENT)
        );
        ''';

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'SLEEP PATTERN',
    0,
    <Entry>[
      Entry('SLEEP', 0),
    ],
  ),
  Entry(
    'NUTRITION',
    0,
    <Entry>[
      Entry('SNACK', 0),
      Entry('MEAL', 0),
      Entry('PUDDING', 0),
    ],
  ),
  Entry(
    'HYDRATION',
    0,
    <Entry>[
      Entry('WATER', 1),
      Entry('JUICE', 1),
      Entry('COFEE', 1),
      Entry('MILK', 1),
      Entry('YOGURT', 1),
    ],
  ),
  Entry(
    'INCIDENT',
    0,
    <Entry>[
      Entry('FALL', 0),
      Entry('VOMIT', 0),
      Entry('WOUND', 0),
      Entry('Loss of consciousness', 0),
      Entry('Stroke', 0),
      Entry('Fracture', 0),
      Entry('Aggression', 0),
      Entry('Other', 2),
    ],
  ),
  Entry(
    'MEDICATION',
    0,
    <Entry>[
      Entry('Paracetamol', 0),
      Entry('Bactron', 0),
      Entry('Colypan', 0),
      Entry('Bitenol', 0),
    ],
  ),
  Entry(
    'PERSONAL CARE',
    0,
    <Entry>[
      Entry('INDEPENDENT', 0),
      Entry('ASSISTED', 0),
      Entry('HANDS', 0),
      Entry('MOUTH', 0),
      Entry('FACE', 0),
      Entry('HAIR', 0),
      Entry('GROIN', 0),
      Entry('BODY', 0),
    ],
  ),
  Entry(
    'SOCIAL ACTIVITIES',
    0,
    <Entry>[
      Entry('INDOORS', 0),
      Entry('OUTDOORS', 0),
      Entry('PERSONAL', 0),
      Entry('GROUP', 0),
      Entry('PASIVE', 0),
      Entry('ACTIVE', 0),
    ],
  ),
  Entry(
    'MOOD & BEHAVIOUR',
    0,
    <Entry>[
      Entry('AGGRESSION', 0),
      Entry('ANXIETY', 0),
      Entry('SADNESS', 0),
      Entry('DELUSION', 0),
      Entry('HALLUCINATION', 0),
      Entry('NEUTRAL', 0),
      Entry('CONTENTED', 0),
      Entry('JOYFUL', 0),
      Entry('ECSTATIC', 0),
    ],
  ),
  Entry(
    'MOBILITY',
    0,
    <Entry>[
      Entry('INDEPENDENT', 0),
      Entry('AIDED BY WALKING STICK', 0),
      Entry('AIDED BY ZIMMER FRAME', 0),
      Entry('FURNITURE SURFING', 0),
      Entry('UNSTEADY', 0),
    ],
  ),
  Entry(
    'SKIN INTEGRITY',
    0,
    <Entry>[
      Entry('REDNESS', 0),
      Entry('ITCHINESS', 0),
      Entry('ABRATION', 0),
      Entry('BRUISE', 0),
      Entry('INFLAMMATION', 0),
      Entry('WOUND', 0),
      Entry('DRY', 0),
      Entry('PRESSURE SORE', 0),
      Entry('BURNT', 0),
    ],
  ),
  Entry(
    'PAIN MANAGEMENT',
    0,
    <Entry>[
      Entry('LOCALIZE', 1),
      Entry('EXTERNAL', 1),
    ],
  ),
  Entry(
    'NOTES',
    0,
    <Entry>[
      Entry('OBSERVATION', 2),
    ],
  ),
];
