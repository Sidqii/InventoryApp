import 'package:flutter/material.dart';
import 'package:pusdatin_end/model/app_riwayat.dart';

class FormCardHeaderOperator extends StatelessWidget {
  final AppRiwayatModel item;
  final bool isExpanded;
  final VoidCallback onBtnExpand;

  const FormCardHeaderOperator({
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '${item.jumlah}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(' Unit '),
                        Text(
                          '${item.detail.first.unitmodel.produk?.barang ?? '-'}',
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                    ],
                  )
                ],
              ),
              const Divider(thickness: 1),
              Row(
                children: [
                  const SizedBox(
                    width: 75,
                    child: Text(
                      'Peminjam: ',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Text(
                    item.pemohon.nama ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const Text(' | '),
                  Text(
                    item.instansi ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Color.fromARGB(255, 5, 73, 189),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 75,
                    child: Text(
                      'Keperluan: ',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      item.hal ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Container(
                      width: 60,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Center(
                        child: Text(
                          'Setuju',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    child: Container(
                      width: 50,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Center(
                        child: Text(
                          'Tolak',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
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
