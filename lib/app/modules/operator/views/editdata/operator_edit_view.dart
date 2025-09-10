import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:inven/app/data/models/AppBarang.dart';
import 'package:inven/app/modules/operator/controllers/operator_edit_controller.dart';
import 'package:inven/app/modules/operator/views/editdata/edit_panel_footer.dart';
import 'package:inven/app/modules/operator/views/editdata/edit_panel_form.dart';
import 'package:inven/app/modules/operator/views/editdata/edit_panel_header.dart';

class OperatorEditView extends GetView<OperatorEditController> {
  final AppBarang model;

  OperatorEditView({required this.model, super.key}) {
    controller.initData(model);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditPanelHeader(model: model),

          const SizedBox(height: 10),

          Expanded(child: EditPanelForm()),

          const SizedBox(height: 15),

          EditPanelFooter(model: model),
        ],
      ),
    );
  }
}
