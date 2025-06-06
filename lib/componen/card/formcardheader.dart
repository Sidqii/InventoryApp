import 'package:flutter/material.dart';
import 'package:pusdatin_end/dataset/model/pengajuan.dart';

class FormCardHeader extends StatelessWidget {
  final PengajuanModels item;
  final bool isExpanded;
  final VoidCallback onBtnExpand;

  const FormCardHeader({
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
                '${item.namaBarang}',
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
                    item.jumlah.toString(),
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
                    item.username,
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
                    item.instansi,
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
                    item.tglKembali,
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
