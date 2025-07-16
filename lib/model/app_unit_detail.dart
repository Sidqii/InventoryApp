import 'package:pusdatin_end/model/app_unit.dart';

class AppUnitDetailModel {
  final int id;
  final int unit;
  final AppUnitModel unitmodel;

  AppUnitDetailModel({
    required this.id,
    required this.unit,
    required this.unitmodel,
  });

  factory AppUnitDetailModel.fromJson(Map<String, dynamic> json) {
    return AppUnitDetailModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      unit: int.tryParse(json['id_unit_barang'].toString()) ?? 0,
      unitmodel: AppUnitModel.fromJson(json['unit_barang']),
    );
  }
}
