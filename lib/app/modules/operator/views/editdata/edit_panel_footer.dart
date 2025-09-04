import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:inven/app/data/models/AppBarang.dart';
import 'package:inven/app/global/widgets/CustomBtnForm.dart';
import 'package:inven/app/modules/operator/controllers/operator_edit_controller.dart';

class EditPanelFooter extends GetView<OperatorEditController> {
  final AppBarang model;

  const EditPanelFooter({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 130,
          child: CustomBtnForm(
            Label: 'simpan',
            isLoading: controller.isLoading.value,
            OnPress: () {
              if (!controller.isLoading.value) {
                showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      title: const Text('Konfirmasi?'),
                      content: const Text(
                        'Yakin ingin simpan perubahan data barang?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: const Text(
                            'Gajadi',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade900,
                          ),
                          onPressed: () {
                            Navigator.of(ctx).pop();
                            controller.updateBarang(model.id);
                          },
                          child: const Text(
                            'Simpan',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
