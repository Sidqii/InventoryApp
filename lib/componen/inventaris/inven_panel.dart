import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_inventaris.dart';
import 'package:pusdatin_end/widget/custominfocard.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class InvenPanel extends StatelessWidget {
  const InvenPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlInventaris>();

    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        right: 20,
        left: 20,
        bottom: 10,
      ),
      width: double.infinity,
      child: Column(
        children: [
          CustomTxtField(
            controller: ctrl.filterctrl,
            label: 'Cari barang',
            validator: null,
            keyboardtype: TextInputType.text,
            focusnode: ctrl.filterfocus,
            onfieldsubmitted: (val) {
              ctrl.filterData(val);
            },
            onchanged: (val) {
              ctrl.filterData(val);
            },
          ),
          const SizedBox(height: 12),
          Expanded(child: Obx(
            () {
              if (ctrl.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (ctrl.filterItem.isEmpty) {
                return const Center(
                  child: Text('Data kosong'),
                );
              }
              return ListView.builder(
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: true,
                itemCount: ctrl.filterItem.length,
                itemBuilder: (context, index) {
                  var item = ctrl.filterItem[index];
                  return RepaintBoundary(
                    child: CustomInfoCard(
                      title: item.namaBarang,
                      subtitle: item.kategori,
                      details: {
                        'Stok': item.stok,
                        'Status': item.status,
                        'Lokasi': item.namaLokasi,
                      },
                    ),
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
