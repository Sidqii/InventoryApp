import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pusdatin_end/model/app_barang.dart';

class CtrlEditInven extends GetxController {
  late AppBarangModel data;

  final note = TextEditingController();
  final jenis = TextEditingController();
  final barang = TextEditingController();
  final deskripsi = TextEditingController();
  final merk = TextEditingController();
  final vendor = TextEditingController();
  final garansi = TextEditingController();
  final sumber = TextEditingController();
  final pengadaan = DateTime.now().obs;

  final spesifikasi = <String, TextEditingController>{}.obs;

  void init(AppBarangModel d) {
    data = d;
    note.text = d.note;
    jenis.text = d.jenis.jenis;
    barang.text = d.barang;
    deskripsi.text = d.deskripsi;
    merk.text = d.merk;
    vendor.text = d.vendor;
    garansi.text = d.garansi.toString();
    sumber.text = d.sumber;
    pengadaan.value = DateTime.tryParse(
          d.pengadaan.toString(),
        ) ??
        DateTime.now();
    spesifikasi.clear();
    d.spesifikasi.forEach((key, value) {
      spesifikasi[key] = TextEditingController(text: value.toString());
    });
  }

  bool validate() {
    if (barang.text.trim().isEmpty) {
      Get.snackbar('Validasi Gagal', 'Nama barang tidak boleh kosong');
      return false;
    }

    if (jenis.text.trim().isEmpty) {
      Get.snackbar('Validasi Gagal', 'Jenis barang tidak boleh kosong');
      return false;
    }

    if (garansi.text.trim().isEmpty) {
      Get.snackbar('Validasi Gagal', 'Masa garansi tidak boleh kosong');
      return false;
    }

    if (int.tryParse(garansi.text.trim()) == null) {
      Get.snackbar('Validasi Gagal', 'Garansi harus berupa angka');
      return false;
    }

    return true;
  }

  bool checkChanges() {
    if (barang.text != data.barang) return true;
    if (jenis.text != data.jenis.jenis) return true;
    if (deskripsi.text != data.deskripsi) return true;
    if (note.text != data.note) return true;
    if (merk.text != data.merk) return true;
    if (vendor.text != data.vendor) return true;
    if (sumber.text != data.sumber) return true;

    String tglUI = pengadaan.value.toIso8601String().substring(0, 10);
    if (tglUI != data.pengadaan) return true;

    if (garansi.text != data.garansi.toString()) return true;

    final newSpecs = <String, String>{};
    spesifikasi.forEach((key, controller) {
      newSpecs[key] = controller.text.trim();
    });

    final oldSpecs = data.spesifikasi.map(
      (k, v) => MapEntry(k, v.toString().trim()),
    );

    return !mapEquals(newSpecs, oldSpecs);
  }

  @override
  void onClose() {
    note.dispose();
    jenis.dispose();
    barang.dispose();
    deskripsi.dispose();
    merk.dispose();
    vendor.dispose();
    garansi.dispose();
    spesifikasi.forEach((key, controller) => controller.dispose());
  }

  Future<void> patch() async {
    List<Map<String, dynamic>> op = [];

    if (barang.text != data.barang) {
      op.add({'op': 'replace', 'path': '/nama_barang', 'value': barang.text});
    }

    if (jenis.text != data.jenis.jenis) {
      op.add({'op': 'replace', 'path': '/jenis', 'value': jenis.text});
    }

    if (deskripsi.text != data.deskripsi) {
      op.add({'op': 'replace', 'path': '/deskripsi', 'value': deskripsi.text});
    }

    if (note.text != data.note) {
      op.add(
          {'op': 'replace', 'path': '/catatan_perawatan', 'value': note.text});
    }

    if (merk.text != data.merk) {
      op.add({'op': 'replace', 'path': '/merk', 'value': merk.text});
    }

    if (vendor.text != data.vendor) {
      op.add({'op': 'replace', 'path': '/vendor', 'value': vendor.text});
    }

    if (sumber.text != data.sumber) {
      op.add(
        {'op': 'replace', 'path': '/sumber_pengadaan', 'value': sumber.text},
      );
    }

    String tglUI = pengadaan.value.toIso8601String().substring(0, 10);
    String tglDB = data.pengadaan;

    if (tglUI != tglDB) {
      op.add({
        'op': 'replace',
        'path': '/tanggal_pengadaan',
        'value': pengadaan.value.toIso8601String()
      });
    }

    if (garansi.text != data.garansi.toString()) {
      op.add({
        'op': 'replace',
        'path': '/masa_garansi',
        'value': int.tryParse(garansi.text) ?? 0
      });
    }

    final newSpecs = <String, String>{};
    spesifikasi.forEach((key, controller) {
      newSpecs[key] = controller.text.trim();
    });

    final oldSpecs = data.spesifikasi.map((k, v) {
      return MapEntry(k, v.toString().trim());
    });

    newSpecs.forEach((key, value) {
      if (oldSpecs[key] != value) {
        op.add({
          'op': 'replace',
          'path': '/spesifikasi_teknis/${Uri.encodeComponent(key)}',
          'value': value
        });
      }
    });

    if (op.isEmpty) {
      Get.back();
      Get.snackbar('Gagal', 'Tidak ada perubahan');
      return;
    }

    final res = await http.patch(
      Uri.parse('http://127.0.0.1:8000/api/barang/${data.id}/patch'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(op),
    );

    if (res.statusCode == 200) {
      Get.back();
      Get.snackbar('Sukses', 'Data berhasil diperbarui');
    } else {
      Get.back();
      Get.snackbar('Gagal', 'Data gagal diperbarui');
    }
  }
}
