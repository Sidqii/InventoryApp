import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/interface/operator/return/ReturnCardOperator.dart';
import 'package:pusdatin_end/widget/customappbar.dart';
import 'package:pusdatin_end/widget/customfilterchips.dart';

class ReturnPanelOperator extends StatelessWidget {
  const ReturnPanelOperator({super.key});

  @override
  Widget build(BuildContext context) {
    final RxInt slcfltr = 1.obs;
    final Map<int, String> fltropt = {
      0: '|||',
      1: 'Dipinjam',
      2: 'Perawatan',
      3: 'Perbaikan',
    };

    return Scaffold(
      appBar: CustomAppbar(title: 'Pengembalian', boldTitle: 'Barang'),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 10,
          right: 20,
          left: 20,
          bottom: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomFilterChips(
                    options: fltropt,
                    selected: slcfltr.value,
                    onSelected: (val) {
                      slcfltr.value = val;
                    },
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.refresh),
                  ),
                ],
              );
            }),
            const SizedBox(height: 15),
            Expanded(
              child: ReturnCardOperator(),
            )
          ],
        ),
      ),
    );
  }
}
