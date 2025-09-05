import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/global/widgets/CustomBtnForm.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';

class PengembalianEmpty extends GetView<StaffController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Ajukan peminjaman barang',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 40,
            child: Center(
              child: CustomBtnForm(
                icon: Icon(Icons.add,size: 20, color: Colors.white),
                isLoading: controller.isLoading.value,
                OnPress: () {
                  controller.onChangePage(0);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
