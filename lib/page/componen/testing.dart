import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputNamaController extends GetxController {
  var nama = ''.obs;
}

class ReactiveNamaPage extends StatelessWidget {
  final InputNamaController controller = Get.put(InputNamaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reactive Input Nama')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onChanged: (val) => controller.nama.value = val,
              decoration: InputDecoration(
                labelText: 'Ketik Nama',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Obx(
              () => Text(
                "Halo, ${controller.nama.value}",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
