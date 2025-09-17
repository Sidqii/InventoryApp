import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppPengajuan.dart';
import 'package:inven/app/global/widgets/CustomBtnForm.dart';
import 'package:inven/app/modules/operator/controllers/operator_controller.dart';

class ProsesPanel extends GetView<OperatorController> {
  final AppPengajuan model;

  const ProsesPanel({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final white = Colors.grey.shade50;
    double size = 15;
    final tStyle = TextStyle(fontSize: 12, color: Colors.white);

    final pemohon = model.pengguna?.nama ?? '';

    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '  Unit dipinjam ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    pemohon,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue.shade400,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close, color: Colors.red.shade400),
              ),
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: model.unit?.length ?? 0,
              itemBuilder: (context, index) {
                final unit = model.unit![index];

                return Obx(() {
                  return CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    title: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.inventory_2_sharp,
                                  color: white,
                                  size: size,
                                ),
                                Text(' ${unit.kdUnit}', style: tStyle),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.qr_code_2_sharp,
                                  color: white,
                                  size: size,
                                ),
                                Text(' ${unit.noSeri}', style: tStyle),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    value: controller.selectUnit[unit.id] ?? false,
                    onChanged: (val) {
                      controller.selectUnit[unit.id] = val ?? false;
                    },
                  );
                });
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: controller.ctrlNote,
              cursorColor: Colors.grey.shade900,
              style: TextStyle(color: Colors.grey.shade900, fontSize: 12),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.notes, color: Colors.grey.shade900),
                label: Text('Catatan', style: TextStyle(fontSize: 14)),
                labelStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontWeight: FontWeight.w600,
                ),
                focusColor: Colors.grey.shade900,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade900),
                ),
              ),
            ),
          ),

          Obx(() {
            return Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
              child: CustomBtnForm(
                label: 'selesai',
                isLoading: controller.isBtnLoad.value,
                OnPress: () {
                  //TODO
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
