import 'dart:io';
import 'package:flutter/services.dart';
import 'package:care_archives/model/activity_model.dart';
import 'package:care_archives/model/medicine_model.dart';
import 'package:care_archives/model/user_model.dart';
import 'package:care_archives/config/constant.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database? db;

class DatabaseUtils {
  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>>? selectQueryResult,
      int? insertAndUpdateQueryResult,
      List<dynamic>? params]) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  static const tableActivities = """
  CREATE TABLE IF NOT EXISTS Activities (
        id TEXT PRIMARY KEY,
        category TEXT,
        subcategory TEXT
        description TEXT,
        date TEXT,
        user_id TEXT,
      );""";

  Future<void> initDatabase() async {
    var databasesPath = await getDatabasesPath();
    print(databasesPath);
    String path = join(databasesPath, "mycare.db");

    //await deleteDatabase(path);

    // Check if the database exists
    var exists = await databaseExists(path);
    print("Await database exist....");
    print(databasesPath);
    print(exists);

    if (!exists) {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, "mycare.db");

      // open the database
      Database database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(initDb);
        await db.execute(tableActivities);
      });

      // Close the database
      await database.close();
    } else {
      print("Opening existing database");
    }
    db = await openDatabase(path, readOnly: false);
  }

  Future<Database?> getDb() async {
    return db;
  }

  /*static Future<List<VerbModel>> getVerbs(String lvl) async {
    final sql = "SELECT * FROM verb WHERE level = '$lvl'";
    final data = await db.rawQuery(sql);
    final verb = data.map((i) => VerbModel.fromMap(i)).toList();
    return verb;
  }*/

  Future<dynamic> insertUser(UserModel user) async {
    // Get a reference to the database.
    //final Database db = await database;
    final data = await db?.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return data;
  }

  Future<List<UserModel>?> getUsers() async {
    final sql = "SELECT * FROM users";
    final data = await db?.rawQuery(sql);
    final users = data?.map((i) => UserModel.fromMap(i)).toList();
    return users;
  }

  Future<UserModel?> getUser(int id) async {
    List<Map?>? maps = await db?.query('users',
        columns: [
          columnId,
          columnName,
          columnRole,
          columnAvatar,
          columnBirthday,
          columnCondition,
          columnRepresentative,
          columnKin,
          columnSurgery,
          columnGp
        ],
        where: '$columnId = ?',
        whereArgs: [id]);

    //return UserModel.fromMap(maps.first);
  }

  Future<dynamic> insertMedicine(MedicineModel medicine) async {
    // Get a reference to the database.
    //final Database db = await database;
    final data = await db?.insert(
      'medicines',
      medicine.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return data;
  }

  Future<List<MedicineModel>?> getMedicines() async {
    final sql = "SELECT * FROM medicines";
    final data = await db?.rawQuery(sql);
    final medicines = data?.map((i) => MedicineModel.fromMap(i)).toList();
    return medicines;
  }

  Future<dynamic> insertActivity(ActivityModel activity) async {
    print(activity);

    int? id1 = await db?.rawInsert(
        'INSERT INTO Activities(category, subcategory, description, date, user_id) VALUES("${activity.category}","${activity.subcategory}","${activity.description}","${activity.date}","${activity.userId}")');
    print('inserted1: $id1');

    /*final data = await db?.insert(
      'activities',
      activity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );*/
    return data;
  }

  Future<List<ActivityModel>?> getActivities() async {
    final sql = "SELECT * FROM medicines";
    final data = await db?.rawQuery(sql);
    final activities = data?.map((i) => ActivityModel.fromMap(i)).toList();
    return activities;
  }
}
