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
        // const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${item['nama_barang']}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    'Jumlah: ',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${item['jumlah']}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' | ',
                  ),
                  Text(
                    'Diajukan oleh: ',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    item['username'],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                'Instansi: ${item['instansi']}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff295BA7),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    'Akan dikembalikan pada: ',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    item['tgl_kembali'],
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
