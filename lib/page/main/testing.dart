import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;
}

class ReactiveCounterPage extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    print(">> 🔁 build() dipanggil SEKALI (ReactiveCounterPage)");

    return Scaffold(
      appBar: AppBar(title: Text('Reactive Counter')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            return Text(
              'Angka: ${controller.count.value}',
              style: TextStyle(fontSize: 24),
            );
          }),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              controller.count.value++;
            },
            child: Text('Tambah'),
          ),
        ],
      ),
    );
  }
}
