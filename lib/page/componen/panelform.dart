import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:pusdatin_end/module/controller/ctrl_pengajuan.dart';
import 'package:pusdatin_end/module/controller/ctrl_user.dart';
import 'package:pusdatin_end/module/services/services_items.dart';
import 'package:pusdatin_end/utils/validator.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class Panelform extends StatefulWidget {
  const Panelform({super.key});

  @override
  State<Panelform> createState() => PanelformState();
}

class PanelformState extends State<Panelform> {
  final ctrlPengajuan = Get.put(CtrlPengajuan());
  final user = Get.find<CtrlUser>().user.value!;
  final _formkey = GlobalKey<FormState>();

  List<Map<String, dynamic>> daftarBarang = [];
  int? selectedItemId;
  String? selectedItemName;
  int stokItem = 0;
  Key dropdownkey = UniqueKey();

  final _jumlahCtrl = TextEditingController();
  final _tglKembaliCtrl = TextEditingController();
  final _instansiCtrl = TextEditingController();
  final _halCtrl = TextEditingController();

  final _instansiFocus = FocusNode();
  final _halFocus = FocusNode();
  final _jumlahFocus = FocusNode();
  final _tglKembaliFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    loaditems();
  }

  void loaditems() async {
    final services = ServicesItems();
    final data = await services.getItems();
    setState(() {
      daftarBarang = data;
    });
  }

  void ajukan() {
    if (_formkey.currentState!.validate()) {
      int idPengguna = user.id;
      int idBarang = selectedItemId ?? 0;
      int jumlah = int.tryParse(_jumlahCtrl.text) ?? 0;
      ctrlPengajuan.kirimPengajuan(
        idPengguna,
        idBarang,
        jumlah,
        _tglKembaliCtrl.text,
        _instansiCtrl.text,
        _halCtrl.text,
      ).then((success) {
          if (success) {
            _jumlahCtrl.clear();
            _tglKembaliCtrl.clear();
            _instansiCtrl.clear();
            _halCtrl.clear();

            setState(() {
              selectedItemName = null;
              selectedItemId = null;
              dropdownkey = UniqueKey();
              stokItem = 0;
            });
          }
        });
    }
  }

  void dispose() {
    _jumlahCtrl.dispose();
    _tglKembaliCtrl.dispose();
    _instansiCtrl.dispose();
    _halCtrl.dispose();

    _jumlahFocus.dispose();
    _tglKembaliFocus.dispose();
    _instansiFocus.dispose();
    _halFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 40,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informasi Peminjam:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: user.username,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Peminjam',
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.transparent,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomTxtField(
                    controller: _instansiCtrl,
                    label: 'Instansi',
                    validator: null,
                    keyboardtype: TextInputType.text,
                    obscuretxt: false,
                    focusnode: _instansiFocus,
                    onfieldsubmitted: (_) {
                      FocusScope.of(context).requestFocus(_halFocus);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomTxtField(
              controller: _halCtrl,
              label: 'Hal',
              validator: null,
              keyboardtype: TextInputType.text,
              obscuretxt: false,
              focusnode: _halFocus,
              onfieldsubmitted: (_) {
                FocusScope.of(context).requestFocus();
              },
            ),
            const SizedBox(height: 40),
            const Text(
              'Detail Barang:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: DropdownMenu<String>(
                    key: dropdownkey,
                    hintText: 'Pilih barang',
                    initialSelection: selectedItemName,
                    width: MediaQuery.sizeOf(context).width * 0.48,
                    onSelected: (val) {
                      setState(() {
                        selectedItemName = val;
                        final selectedItem = daftarBarang.firstWhere(
                          (item) => item['nama_barang'] == val,
                          orElse: () => {},
                        );
                        selectedItemId = int.tryParse(
                          selectedItem['id'].toString(),
                        );
                        stokItem = int.tryParse(
                              selectedItem['stok'].toString(),
                            ) ??
                            0;
                      });
                    },
                    dropdownMenuEntries: daftarBarang.map((item) {
                      return DropdownMenuEntry<String>(
                        value: item['nama_barang'],
                        label: item['nama_barang'],
                      );
                    }).toList(),
                    inputDecorationTheme: const InputDecorationTheme(
                      filled: true,
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomTxtField(
                    controller: _jumlahCtrl,
                    label: selectedItemId != null
                        ? 'Jumlah Max $stokItem'
                        : 'Jumlah',
                    validator: null,
                    keyboardtype:
                        TextInputType.numberWithOptions(decimal: false),
                    obscuretxt: false,
                    focusnode: _jumlahFocus,
                    onfieldsubmitted: (_) {
                      FocusScope.of(context).requestFocus(_tglKembaliFocus);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomTxtField(
              controller: _tglKembaliCtrl,
              label: 'Tanggal pengembalian',
              validator: dateValidator,
              keyboardtype: TextInputType.text,
              obscuretxt: false,
              focusnode: _tglKembaliFocus,
              onfieldsubmitted: (_) {
                if (_formkey.currentState!.validate()) {
                  ajukan();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
