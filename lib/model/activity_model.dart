final String tableUser = 'activities';
final String columnCategory = 'category';
final String columnSubcategory = 'subcategory';
final String columnDescription = 'description';
final String columnDate = 'date';
final String columnUserId = 'user_id';

class ActivityModel {
  String category = '';
  String subcategory = '';
  String description = '';
  String date = '';
  String userId = '';

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      category: columnCategory,
      subcategory: columnSubcategory,
      description: columnDescription,
      date: columnDate,
      userId: columnUserId,
    };
    return map;
  }

  ActivityModel(this.category, this.subcategory, this.description, this.date,
      this.userId);

  ActivityModel.fromMap(Map<String?, dynamic> map) {
    category = map[columnCategory];
    subcategory = map[columnSubcategory];
    description = map[columnDescription];
    date = map[columnDate];
    userId = map[columnUserId];
  }
}

class Activity {
  Activity(this.category, this.subcategory);

  String category;
  String subcategory;
}
