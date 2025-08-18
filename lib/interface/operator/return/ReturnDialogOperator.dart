import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/operator/CtrlSubmit.dart';
import 'package:pusdatin_end/model/app_unit_detail.dart';

class ReturnDialogOperator extends StatelessWidget {
  final List<AppUnitDetailModel> items;
  final void Function(List<AppUnitDetailModel>)? onSubmit;

  final int idJenisPerubahan;
  final int idStatusUnit;
  final int idUser;
  final String? note;

  const ReturnDialogOperator({
    super.key,
    required this.items,
    this.onSubmit,
    required this.idJenisPerubahan,
    required this.idStatusUnit,
    required this.idUser,
    this.note,
  });

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlSubmit>();

    ctrl.setItems(items);

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Pengembalian Unit',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.red.shade300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Pilih semua
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Obx(
                () {
                  return Checkbox(
                    value: ctrl.selectAll.value,
                    onChanged: (bool? v) {
                      if (v != null) {
                        ctrl.selectAllItem(v);
                      }
                    },
                  );
                },
              ),
              const Text('Pilih semua'),
            ],
          ),

          // List unit
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
              ),
              child: Obx(
                () {
                  return ListView.separated(
                    itemCount: ctrl.items.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(height: 1);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      final AppUnitDetailModel item = ctrl.items[index];

                      return CheckboxListTile(
                        value: item.selected,
                        onChanged: (bool? v) {
                          if (v != null) {
                            ctrl.selectItem(index, v);
                          }
                        },
                        title: Text(item.unitmodel.seri ?? ''),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                      );
                    },
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Obx(
                () {
                  return Text(
                    'Dipilih: ${ctrl.selectCount} unit',
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  );
                },
              ),
              SizedBox(
                width: 130,
                child: Obx(
                  () {
                    return ElevatedButton(
                      onPressed: ctrl.isloading.value
                          ? null
                          : () async {
                              await ctrl.updateAllUnit(
                                idJenisPerubahan,
                                idStatusUnit,
                                idUser,
                                note,
                              );

                              if (onSubmit != null) {
                                final List<AppUnitDetailModel> selected =
                                    <AppUnitDetailModel>[];
                                for (final AppUnitDetailModel it
                                    in ctrl.items) {
                                  if (it.selected) {
                                    selected.add(it);
                                  }
                                }
                                onSubmit!(selected);
                              }

                              if (context.mounted) {
                                Navigator.of(context).pop();
                              }
                            },
                      child: Text(
                        ctrl.isloading.value ? 'Memproses' : 'Proses',
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
