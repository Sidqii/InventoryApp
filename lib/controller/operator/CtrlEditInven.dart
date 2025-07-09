import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/model/app_barang.dart';

class CtrlEditInven extends GetxController {
  late AppBarangModel data;

  final note = TextEditingController();
  final jenis = TextEditingController();
  final barang = TextEditingController();
  final deskripsi = TextEditingController();
  // final spesifikasi = TextEditingController();

  final spesifikasi = <String, TextEditingController>{}.obs;

  final fcsnote = FocusNode();
  final fcsjenis = FocusNode();
  final fcsbarang = FocusNode();
  final fcsdeskripsi = FocusNode();
  final fcsspesifikasi = FocusNode();

  void init(AppBarangModel d) {
    data = d;
    note.text = d.note;
    jenis.text = d.jenis.jenis;
    barang.text = d.barang;
    deskripsi.text = d.deskripsi;
    spesifikasi.clear();
    d.spesifikasi.forEach((key, value) {
      spesifikasi[key] = TextEditingController(text: value.toString());
    });
  }

  @override
  void onClose() {
    note.dispose();
    jenis.dispose();
    barang.dispose();
    deskripsi.dispose();
    spesifikasi.forEach((key, controller) => controller.dispose());
  }

  Future<void> patch() async {
    List<Map<String, dynamic>> op = [];

    if (note.text != data.note) {
      op.add(
        {'op': 'replace', 'path': '/catatan_perawatan', 'value': note.text},
      );
    }
    if (jenis.text != data.jenis.jenis) {
      op.add(
        {'op': 'replace', 'path': '/jenis', 'value': jenis.text},
      );
    }
    if (barang.text != data.barang) {
      op.add(
        {'op': 'replace', 'path': '/nama_barang', 'value': barang.text},
      );
    }
    if (note.text != data.note) {
      op.add(
        {'op': 'replace', 'path': '/catatan_perawatan', 'value': note.text},
      );
    }
    if (note.text != data.note) {
      op.add(
        {'op': 'replace', 'path': '/catatan_perawatan', 'value': note.text},
      );
    }

    if (op.isEmpty) {
      Get.back();
      return;
    }

    final res = await http.patch(
      Uri.parse('nanti diisi'),
      headers: {'Content-Type': 'json/application'},
      body: jsonEncode(op),
    );

    if (res.statusCode == 200) {
      Get.back();
      Get.snackbar('Sukses', 'Data berhasil diperbarui');
    } else {
      Get.back();
      Get.snackbar('Gagal', 'Data gagal diprbarui');
    }
  }
}
