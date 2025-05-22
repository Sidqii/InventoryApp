import 'package:flutter/material.dart';

class HistoryCardHeader extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool isExpanded;
  final VoidCallback onBtnExpand;

  const HistoryCardHeader({
    required this.item,
    required this.isExpanded,
    required this.onBtnExpand,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${item['nama_barang'].toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  const Text(
                    'Jumlah: ',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    item['jumlah'].toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    ' | ',
                  ),
                  const Text(
                    'Diajukan oleh: ',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    item['username'].toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Instansi: ',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    item['instansi'].toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff295BA7),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text(
                    'Akan dikembalikan pada: ',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    item['tgl_kembali'].toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: Icon(
            isExpanded ? Icons.expand_less : Icons.expand_more,
          ),
          onPressed: onBtnExpand,
        ),
      ],
    );
  }
}
