import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_items.dart';
import 'package:pusdatin_end/widget/customappbar.dart';
import 'package:pusdatin_end/widget/custominfocard.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class InventoriPage extends StatefulWidget {
  const InventoriPage({super.key});

  @override
  State<InventoriPage> createState() => InventoriPageState();
}

class InventoriPageState extends State<InventoriPage> {
  final _filterCtrl = TextEditingController();
  final _filterFocus = FocusNode();
  final CtrlItems controller = Get.find<CtrlItems>();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => controller.fetchData());
  }

  @override
  void dispose() {
    _filterCtrl.dispose();
    _filterFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Data',
        boldTitle: 'Barang',
        showNotif: false,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
        width: double.infinity,
        child: Column(
          children: [
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
            Expanded(
              child: Obx(() {
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
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: true,
                  itemCount: controller.filterItem.length,
                  itemBuilder: (context, index) {
                    var item = controller.filterItem[index];
                    return RepaintBoundary(
                      child: CustomInfoCard(
                        title: item['nama_barang'],
                        subtitle: item['nama_kategori'],
                        details: {
                          'stok': item['stok'],
                          'Status': item['status'],
                          'Lokasi': item['nama_lokasi']
                        },
                      ),
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
