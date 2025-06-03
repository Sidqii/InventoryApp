import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/widget/customfilterchips.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  final ctrlpersetujuan = Get.put(CtrlPersetujuan());
  final comment = TextEditingController();
  String selectedFilter = 'Semua';
  final List<String> filterOptions = [
    'Semua',
    'Menunggu',
    'Disetujui',
    'Ditolak',
    'Selesai',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 40,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(4, 4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Riwayat Pengajuan',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 15),
          CustomFilterChips(
            options: filterOptions,
            selected: selectedFilter,
            onSelected: (val) {
              setState(() {
                selectedFilter = val;
              });
            },
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              children: [
                Obx(() {
                  if (ctrlpersetujuan.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (ctrlpersetujuan.dataPengajuan.isEmpty) {
                    return const Center(
                        child: Text('Tidak ada pengajuan barang'));
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ctrlpersetujuan.dataPengajuan.length,
                    itemBuilder: (context, index) {
                      final item = ctrlpersetujuan.dataPengajuan[index];
                      final idItem = item.id.toString();

                      return Obx(() {
                        final isExpanded =
                            ctrlpersetujuan.expandedId.value == idItem;

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Header
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFFFF3CD),
                                    ),
                                    child: const Icon(Icons.access_time,
                                        color: Colors.orange, size: 16),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(item.namaBarang,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                          'Jumlah: ${item.jumlah} • ${item.username}',
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 12),
                                        ),
                                        Text(
                                          'Instansi: ${item.instansi}',
                                          style: TextStyle(
                                              color: Colors.blue[600],
                                              fontSize: 12),
                                        ),
                                        Text(
                                          item.tglKembali,
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 11),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(isExpanded
                                        ? Icons.expand_less
                                        : Icons.expand_more),
                                    onPressed: () {
                                      ctrlpersetujuan.expandedId.value =
                                          isExpanded ? '' : idItem;
                                    },
                                  ),
                                ],
                              ),

                              /// Expanded area
                              if (isExpanded) ...[
                                const SizedBox(height: 12),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Keperluan:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(height: 4),
                                      Text(item.hal,
                                          style: const TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  cursorColor: Colors.black, // ⬅️ Warna kursor
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black87, // ⬅️ Warna teks
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Komentar',
                                    labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                    floatingLabelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        icon: const Icon(
                                            Icons.check_circle_outline),
                                        label: const Text('Setujui'),
                                        onPressed: () {
                                          ctrlpersetujuan.editPengajuan(
                                              int.parse(item.id.toString()), 2);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.green.shade400,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        icon: const Icon(Icons.cancel_outlined),
                                        label: const Text('Tolak'),
                                        onPressed: () {
                                          ctrlpersetujuan.editPengajuan(
                                              int.parse(item.id.toString()), 3);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red.shade300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        );
                      });
                    },
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
