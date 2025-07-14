import 'package:flutter/material.dart';
import 'package:pusdatin_end/model/app_riwayat.dart';

class FormCardHeaderStaff extends StatelessWidget {
  final RiwayatModel item;
  final bool isExpanded;
  final VoidCallback onBtnExpand;

  const FormCardHeaderStaff({
    required this.item,
    required this.isExpanded,
    required this.onBtnExpand,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color getStatClr(int idstat) {
      switch (idstat) {
        case 1:
          return Colors.yellow.shade400;
        case 2:
          return Colors.green.shade400;
        case 3:
          return Colors.red.shade400;
          break;
        default:
          return Colors.grey.shade400;
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    item.nmBarang,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: getStatClr(item.idStat),
                      shape: BoxShape.circle,
                    ),
                  )
                ],
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
                    item.tanggal,
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
