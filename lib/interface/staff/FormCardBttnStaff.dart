import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/operator/CtrlPersetujuan.dart';

class FormCardBtnStaff extends StatelessWidget {
  final int idPengajuan;

  const FormCardBtnStaff({
    required this.idPengajuan,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ctrlperstujuan = Get.find<CtrlPersetujuan>();

    return Row(
      children: [
        //Button Setuju
        Flexible(
          fit: FlexFit.tight,
          child: SizedBox(
            height: 30,
            child: ElevatedButton.icon(
              label: const Icon(Icons.check),
              onPressed: () {
                ctrlperstujuan.editPengajuan(idPengajuan, 2);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff77B254),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)
                )
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        //Button Tolak
        Flexible(
          fit: FlexFit.tight,
          child: SizedBox(
            height: 30,
            child: ElevatedButton.icon(
              label: const Icon(Icons.close),
              onPressed: () {
                ctrlperstujuan.editPengajuan(idPengajuan, 3);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF96666),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                )
              ),
            ),
          ),
        ),
      ],
    );
  }
}
