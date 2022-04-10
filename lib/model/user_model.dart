final String tableUser = 'user';
final String columnName = 'name';
final String columnRole = 'role';
final String columnAvatar = 'avatar';
final String columnBirthday = 'birthday';
final String columnCondition = 'condition';
final String columnRepresentative = 'representative';
final String columnKin = 'kin';
final String columnSurgery = 'surgery';
final String columnGp = 'gp';
final String columnId = 'id';

class UserModel {
  String name;
  String role;
  String avatar;
  String birthday;
  String condition;
  String representative;
  String kin;
  String surgery;
  String gp;
  int id;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnRole: role,
      columnAvatar: avatar,
      columnBirthday: birthday,
      columnCondition: condition,
      columnRepresentative: representative,
      columnKin: kin,
      columnSurgery: surgery,
      columnGp: gp,
      columnId: id,
    };
    return map;
  }

  UserModel(this.name, this.role, this.avatar, this.birthday, this.condition,
      this.representative, this.kin, this.surgery, this.gp,
      {this.id});

  UserModel.fromMap(Map<String, dynamic> map) {
    this.name = map[columnName];
    this.role = map[columnRole];
    this.avatar = map[columnAvatar];
    this.birthday = map[columnBirthday];
    this.condition = map[columnCondition];
    this.representative = map[columnRepresentative];
    this.kin = map[columnKin];
    this.surgery = map[columnSurgery];
    this.gp = map[columnGp];
    this.id = map[columnId];
  }
}
