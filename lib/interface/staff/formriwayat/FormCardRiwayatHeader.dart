import 'package:flutter/material.dart';
import 'package:pusdatin_end/model/app_riwayat.dart';
import 'package:pusdatin_end/utils/Formatter.dart';

class FormCardHeaderStaff extends StatelessWidget {
  final AppRiwayatModel item;

  const FormCardHeaderStaff({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final barang = item.detail.first.unitmodel.produk?.barang ?? '';
    final jumlah = item.jumlah.toString();
    final tggl = Formatter.dateID(item.kembali ?? '');
    final user = item.pemohon.nama??'';
    final insi = item.instansi ?? '';

    Color statclr(int idstat) {
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
                    barang,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: statclr(item.status),
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
                    jumlah,
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
                    user,
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
                    insi,
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
                    tggl,
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
      ],
    );
  }
}
