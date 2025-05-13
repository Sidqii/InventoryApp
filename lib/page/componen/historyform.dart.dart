import 'package:flutter/material.dart';
import 'package:pusdatin_end/widget/customfilterchips.dart';

class Historyform extends StatefulWidget {
  const Historyform({super.key});

  @override
  State<Historyform> createState() => _HistoryformState();
}

class _HistoryformState extends State<Historyform> {
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
          const Text('Riwayat Pengajuan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
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
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Belum ada pengajuan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Semua pengajuan akan ditampilkan disini',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
