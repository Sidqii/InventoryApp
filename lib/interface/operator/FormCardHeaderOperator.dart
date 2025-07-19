import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlUser.dart';
import 'package:pusdatin_end/interface/operator/FormCardBttnOperator.dart';
import 'package:pusdatin_end/model/app_riwayat.dart';
import 'package:pusdatin_end/utils/Formatter.dart';

class FormCardHeaderOperator extends StatelessWidget {
  final int id;
  final bool expand;
  final AppRiwayatModel item;
  final VoidCallback btn;

  const FormCardHeaderOperator({
    required this.id,
    required this.item,
    required this.expand,
    required this.btn,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //value
    final barang = item.detail.first.unitmodel.produk?.barang ?? '-';
    final kode = item.detail.first.unitmodel.produk?.kode ?? '-';
    final nama = item.pemohon.nama ?? '';
    final instansi = item.instansi ?? '';
    final jumlah = item.jumlah.toString();
    final pengembalian = Formatter.dateID(item.kembali ?? '');
    final deskripsi = item.detail.first.unitmodel.produk?.deskripsi ?? '';

    //TextStyle
    final ctrl = Get.find<CtrlUser>().user.value!;

    final subtitle = const TextStyle(fontSize: 13);

    final subvalue = const TextStyle(fontSize: 13, fontWeight: FontWeight.bold);

    final _instansi = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 9, 81, 206),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                barang,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                kode,
                style: TextStyle(fontSize: 12, letterSpacing: 1),
              ),
              const Divider(thickness: 1),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text('Peminjam', style: subtitle),
                  ),
                  const Text(':'),
                  const SizedBox(width: 5),
                  Text(nama, style: subvalue),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text('Instansi', style: subtitle),
                  ),
                  const Text(':'),
                  const SizedBox(width: 5),
                  Text(instansi, style: _instansi),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text('Jumlah unit', style: subtitle),
                  ),
                  const Text(':'),
                  const SizedBox(width: 5),
                  Text('$jumlah unit', style: subvalue),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text('Pengembalian', style: subtitle),
                  ),
                  const Text(':'),
                  const SizedBox(width: 5),
                  Text(pengembalian, style: subvalue),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text('Deskripsi barang', style: subtitle),
                  ),
                  const Text(':'),
                  const SizedBox(width: 5),
                  Text(deskripsi, style: subvalue)
                ],
              ),
              const SizedBox(height: 10),
              FormCardBtnOperator(pengajuan: item.id, user: ctrl.id)
            ],
          ),
        ),
        IconButton(
          icon: Icon(
            expand ? Icons.expand_less : Icons.expand_more,
          ),
          onPressed: btn,
        ),
      ],
    );
  }
}
