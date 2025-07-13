import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlUser.dart';
import 'package:pusdatin_end/interface/operator/InvenPanelOperator.dart';
import 'package:pusdatin_end/interface/staff/03_InvenPanelStaff.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class HomeInventaris extends StatelessWidget {
  const HomeInventaris({super.key});

  Widget _buildPanel(int? role) {
    if (role == 1) {
      return const InvenPanelOperator();
    } else {
      return const InvenPanelStaff();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlUser>().user.value!;
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Data',
        boldTitle: 'Barang',
      ),
      body: _buildPanel(ctrl.role),
    );
  }
}
