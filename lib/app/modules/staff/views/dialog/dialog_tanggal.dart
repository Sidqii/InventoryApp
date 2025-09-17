import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/global/utils/Formatter.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';

class DialogTanggal extends GetView<StaffController> {
  const DialogTanggal({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Icon(
                    Icons.insert_invitation_sharp,
                    color: Colors.grey.shade50,
                    size: 15,
                  ),
                ),

                const SizedBox(width: 5),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dipinjam:',
                      style: TextStyle(
                        color: Colors.grey.shade50,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      Formatter.dateID(controller.tglPinjam.toString()),
                      style: TextStyle(
                        color: Colors.grey.shade50,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Icon(
                    Icons.watch_later_outlined,
                    color: Colors.grey.shade50,
                    size: 15,
                  ),
                ),

                const SizedBox(width: 5),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dikembalikan:',
                      style: TextStyle(
                        color: Colors.grey.shade50,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      Formatter.dateID(controller.tglKembali.toString()),
                      style: TextStyle(
                        color: Colors.grey.shade50,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
