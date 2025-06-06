import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/controller/ctrl_user.dart';
import 'package:pusdatin_end/componen/riwayat/formhistorylogic.dart';
import 'package:pusdatin_end/widget/customfilterchips.dart';
import 'package:pusdatin_end/widget/custompanel.dart';

class FormHistory extends StatefulWidget {
  const FormHistory({super.key});

  @override
  State<FormHistory> createState() => _FormHistoryState();
}

class _FormHistoryState extends State<FormHistory> {
  final ctrlpersetujuan = Get.find<CtrlPersetujuan>();
  final ctrluser = Get.find<CtrlUser>().user.value!;

  final RxString selectedFilter = 'Semua'.obs;
  final List<String> filterOptions = [
    'Semua',
    'Menunggu',
    'Disetujui',
    'Ditolak',
  ];

  @override
  void initState() {
    super.initState();
    final roleuser = ctrluser.role ?? 0;
    final iduser = ctrluser.id;
    ctrlpersetujuan.getPengajuanByRole(iduser, roleuser);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Riwayat Pengajuan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),
              Obx(() {
                return CustomFilterChips(
                  options: filterOptions,
                  selected: selectedFilter.value,
                  onSelected: (val) {
                    selectedFilter.value = val;
                  },
                );
              }),
              const SizedBox(height: 15),
              Obx(() {
                if (ctrlpersetujuan.isLoading.value == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return formHistoryLogic(selectedFilter: selectedFilter.value);
                }
              }),
            ],
          ),
        ),
      ],
    );
  }
}
