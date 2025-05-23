import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/module/controller/ctrl_user.dart';
import 'package:pusdatin_end/page/main/componen/riwayat/formhistorylogic.dart';
import 'package:pusdatin_end/widget/customfilterchips.dart';

class FormHistory extends StatefulWidget {
  const FormHistory({super.key});

  @override
  State<FormHistory> createState() => _FormHistoryState();
}

class _FormHistoryState extends State<FormHistory> {
  final ctrlpersetujuan = Get.find<CtrlPersetujuan>();
  final ctrluser = Get.find<CtrlUser>().user.value;

  String selectedFilter = 'Semua';
  final List<String> filterOptions = [
    'Semua',
    'Menunggu',
    'Disetujui',
    'Ditolak',
  ];

  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(milliseconds: 300), () {
      final roleuser = ctrluser?.role ?? 0;
      final iduser = ctrluser?.id ?? 0;
      ctrlpersetujuan.getPengajuanByRole(iduser, roleuser);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(4, 2),
              ),
            ],
          ),
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
              CustomFilterChips(
                options: filterOptions,
                selected: selectedFilter,
                onSelected: (val) {},
              ),
              const SizedBox(height: 15),
              Obx(() {
                if (ctrlpersetujuan.isLoading.value == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return formHistoryLogic(selectedFilter: selectedFilter);
                }

                // final roleuser = ctrluser?.role ?? 0;
                // final iduser = ctrluser?.id ?? 0;

                // List<dynamic> listpengajuan = [];
                // if (roleuser == 2) {
                //   for (var item in ctrlpersetujuan.dataPengajuan) {
                //     if (int.tryParse(item['id_pengguna'].toString()) ==
                //         iduser) {
                //       listpengajuan.add(item);
                //     }
                //   }
                // } else {
                //   listpengajuan = ctrlpersetujuan.dataPengajuan;
                // }

                // if (listpengajuan.isEmpty) {
                //   return EmptyPage(
                //     txt: 'Belum ada pengajuan barang',
                //   );
                // }
                // return ListView.builder(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemCount: listpengajuan.length,
                //   itemBuilder: (context, index) {
                //     final item = listpengajuan[index];
                //     return HistoryCardItem(
                //       item: item,
                //       roleuser: getRole(roleuser),
                //     );
                //   },
                // );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
