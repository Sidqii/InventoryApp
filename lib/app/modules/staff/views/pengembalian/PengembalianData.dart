import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppPengembalian.dart';
import 'package:inven/app/global/utils/Formatter.dart';
import 'package:inven/app/global/widgets/CustomBtnForm.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';

class PengembalianData extends GetView<StaffController> {
  final AppPengembalian model;

  const PengembalianData({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    final barang = model.nmBarang;
    final kode = model.kdPinjam;
    final status = model.status;
    final tanggal = model.tglKembali;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    barang,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(kode, style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),

              Row(
                children: [Icon(Icons.inventory, size: 15), Text(' $status')],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Icon(Icons.calendar_month, size: 15),
                  Text(' ${Formatter.dateID(tanggal)}'),
                ],
              ),

              const Divider(),

              ...model.unit!.map((u) {
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.input),
                  title: Text(u.kdUnit),
                  subtitle: Text(
                    'No. Seri: ${u.noSeri} • ${u.kondisi?.kondisi}',
                  ),
                );
              }).toList(),

              const SizedBox(height: 10),

              CustomBtnForm(
                Label: 'kembalikan',
                isLoading: controller.isLoading.value,
                OnPress: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
