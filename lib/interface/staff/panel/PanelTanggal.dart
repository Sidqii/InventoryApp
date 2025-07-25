import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/staff/CtrlPengajuan.dart';
import 'package:pusdatin_end/utils/Formatter.dart';

class PanelTanggal extends StatelessWidget {
  final Function()? onSubmit;

  const PanelTanggal({
    this.onSubmit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlPengajuan>();

    return Obx(() {
      return GestureDetector(
          onTap: () async {
            DateTime? pick = await showDatePicker(
              context: context,
              initialDate: ctrl.ctrlkembali.value,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      onSurface: Colors.black,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (pick != null && !pick.isBefore(DateTime.now())) {
              ctrl.ctrlkembali.value = pick;
            } else {
              Get.snackbar(
                'Gagal',
                'Tanggal pengembalian tidak valid',
                duration: Duration(seconds: 3),
              );
            }
          },
          child: Row(
            children: [
              const SizedBox(
                width: 120,
                child: Text(
                  'Tanggal\nPengembalian',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Text(
                ':',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    Formatter.dateID(
                      ctrl.ctrlkembali.value.toIso8601String(),
                    ),
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ],
          ));
    });
  }
}
