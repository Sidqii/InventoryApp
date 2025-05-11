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
  String selectedCategory = 'Semua';

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
      appBar: AppBar(
        elevation: 3,
        shadowColor: Colors.black.withValues(alpha: 5),
        title: const Row(
          children: const [
            Text(
              'Data',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(width: 1),
            Text(
              'Barang',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_sharp,
            ),
          ),
        ],
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
                        // 'Harga': item['harga']
                      },
                      // currencyField: ['Harga'],
                    ),
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
