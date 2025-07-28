import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/operator/CtrlPersetujuan.dart';

class FormCardBtnOperator extends StatelessWidget {
  final pengajuan;
  final user;
  final note;

  const FormCardBtnOperator({
    required this.pengajuan,
    required this.user,
    this.note,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CtrlPersetujuan>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            ctrl.approval(pengajuan, 2, 2, user, note);
          },
          child: Container(
            width: 60,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(3),
            ),
            child: const Center(
              child: Text(
                'Setuju',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            ctrl.approval(pengajuan, 3, 1, user, note);
          },
          child: Container(
            width: 50,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(3),
            ),
            child: const Center(
              child: Text(
                'Tolak',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
