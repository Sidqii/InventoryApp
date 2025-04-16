import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_items.dart';
import 'package:pusdatin_end/widget/custominfocard.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class BarangPage extends StatefulWidget {
  const BarangPage({super.key});

  @override
  State<BarangPage> createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
  final _filterCtrl = TextEditingController();
  final _filterFocus = FocusNode();
  final CtrlItems controller = Get.find<CtrlItems>();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => controller.fetchData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data barang',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              'Pusdatin Kemhan',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            CustomTxtField(
              controller: _filterCtrl,
              label: 'Cari barang',
              validator: null,
              keyboardtype: TextInputType.text,
              obscuretxt: false,
              focusnode: _filterFocus,
              onfieldsubmitted: (value) {
                controller.filterData(value);
              },
              onChanged: (value) {
                controller.filterData(value);
              },
            ),
            const SizedBox(height: 12),
            Expanded(child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (controller.filterItem.isEmpty) {
                return const Center(
                  child: Text('Data kosong'),
                );
              }
              return ListView.builder(
                itemCount: controller.filterItem.length,
                itemBuilder: (context, index) {
                  var item = controller.filterItem[index];
                  return CustomInfoCard(
                    title: item['nama_barang'],
                    subtitle: item['nama_kategori'],
                    details: {
                      'stok': item['stok'],
                      'Status': item['status'],
                      'Lokasi': item['nama_lokasi']
                      // 'Harga': item['harga']
                    },
                    // currencyField: ['Harga'],
                  );
                },
              );
            }))
          ],
        ),
      ),
    );
  }
}
