import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';

class ValidPanel extends GetView<StaffController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          border: Border.all(color: Colors.red.shade200),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Peringatan:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red.shade900,
                fontSize: 20,
              ),
            ),
        
            const SizedBox(height: 8),
        
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final e = controller.errorList[index];
        
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Icon(Icons.error, size: 15, color: Colors.red.shade400),
                  
                      const SizedBox(width: 5),
                  
                      Expanded(child: Text(e)),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: controller.errorList.length,
            ),
          ],
        ),
      );
    });
  }
}
