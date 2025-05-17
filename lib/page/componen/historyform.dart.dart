import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/widget/customfilterchips.dart';

class Historyform extends StatefulWidget {
  const Historyform({super.key});

  @override
  State<Historyform> createState() => _HistoryformState();
}

class _HistoryformState extends State<Historyform> {
  final ctrlpersetujuan = Get.put(CtrlPersetujuan());
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
          FilterChips(
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
                    return Center(child: CircularProgressIndicator());
                  }
                  if (ctrlpersetujuan.dataPengajuan.isEmpty) {
                    return Center(child: Text('Tidak pengajuan barang'));
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: ctrlpersetujuan.dataPengajuan.length,
                    itemBuilder: (context, index) {
                      final item = ctrlpersetujuan.dataPengajuan[index];
                      final isExpanded = ctrlpersetujuan.expadedId.value ==
                          item['id'].toString();
                      // final comment = TextEditingController();
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade200),
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
                                      Text(
                                        item['nama_barang'] ?? '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Jumlah: ${item['jumlah']} • ${item['username']}',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        'Instansi: ${item['instansi']}',
                                        style: TextStyle(
                                          color: Colors.blue[600],
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        '${item['tgl_kembali']}',
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(isExpanded
                                      ? Icons.expand_less
                                      : Icons.expand_more),
                                  onPressed: () {
                                    ctrlpersetujuan.expadedId.value =
                                        isExpanded ? '' : item['id'].toString();
                                  },
                                ),
                              ],
                            ),
                            if (isExpanded) ...[
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Keperluan:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item['hal'] ?? '',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              )
                            ]
                          ],
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
