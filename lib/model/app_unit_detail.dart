import 'app_unit.dart';

class AppUnitDetailModel {
  final int id;
  final int unit;
  final AppUnitModel unitmodel;
  final String? returned;
  bool selected;
  

  AppUnitDetailModel({
    required this.id,
    required this.unit,
    required this.unitmodel,
    this.returned,
    this.selected = true
  });

  factory AppUnitDetailModel.fromJson(Map<String, dynamic> json) {
    return AppUnitDetailModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      unit: int.tryParse(json['id_unit_barang'].toString()) ?? 0,
      unitmodel: AppUnitModel.fromJson(json['unit_barang']),
      returned: json['returned_at'] as String?,
    );
  }
}
