final String tableMedicine = 'medicines';
final String columnMedicineName = 'name';
final String columnType = 'type';
final String columnDose = 'dose';
final String columnDescription = 'description';
final String columnQuantity = 'quantity';
final String columnMetric = 'metric';
final String columnAdminister = 'administer';
final String columnFrequency = 'frequency';

class MedicineModel {
  String name = '';
  String type = '';
  String dose = '';
  String description = '';
  String quantity = '';
  String metric = '';
  String administer = '';
  String frequency = '';

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnMedicineName: name,
      columnType: type,
      columnDose: dose,
      columnDescription: description,
      columnQuantity: quantity,
      columnMetric: metric,
      columnAdminister: administer,
      columnFrequency: frequency,
    };
    return map;
  }

  MedicineModel(this.name, this.type, this.dose, this.description,
      this.quantity, this.metric, this.administer, this.frequency);

  MedicineModel.fromMap(Map<String, dynamic> map) {
    this.name = map[columnMedicineName];
    this.type = map[columnType];
    this.dose = map[columnDose];
    this.description = map[columnDescription];
    this.quantity = map[columnQuantity];
    this.metric = map[columnMetric];
    this.administer = map[columnAdminister];
    this.frequency = map[columnFrequency];
  }
}
