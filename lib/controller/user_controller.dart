import 'package:care_archives/model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:care_archives/config/database.dart';

Database? db;

class UserController {
  UserController() {
    DatabaseUtils utils = new DatabaseUtils();
    utils.getDb().then((value) => db = value);
  }

  Future<dynamic> insertUser(UserModel user) async {
    // Get a reference to the database.
    //final Database db = await database;
    final data = await db?.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(data);
    return data;
  }

  Future<List<UserModel>?> getUsers() async {
    final sql = "SELECT * FROM users";
    final data = await db?.rawQuery(sql);
    final users = data?.map((i) => UserModel.fromMap(i)).toList();
    return users;
  }

  /*static Future<List<VerbModel>> getVerbs(String lvl) async {
      final sql = "SELECT * FROM verb WHERE level = '$lvl'";
      final data = await db.rawQuery(sql);
      final verb = data.map((i) => VerbModel.fromMap(i)).toList();
      return verb;
    }
  
    static Future<List<MenuModel>> getMenu() async {
      final sql = "SELECT * FROM menu";
      final data = await db.rawQuery(sql);
      final menu = data.map((i) => MenuModel.fromMap(i)).toList();
      return menu;
    }*/
}
