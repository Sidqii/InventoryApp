import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/common/CtrlUser.dart';
import 'package:pusdatin_end/interface/operator/formpanel/FormCardBttnOperator.dart';
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
    final ctrl = Get.find<CtrlUser>().user.value!;

    //value
    final hal = item.hal ?? '';
    final status = item.status;
    final barang = item.detail.first.unitmodel.produk?.barang ?? '-';
    final kode = item.detail.first.unitmodel.produk?.kode ?? '-';
    final nama = item.pemohon.nama ?? '';
    final instansi = item.instansi ?? '';
    final jumlah = item.jumlah.toString();
    final pengembalian = Formatter.dateID(item.kembali ?? '');

    //TextStyle
    final subtitle = const TextStyle(fontSize: 13);
    final subvalue = const TextStyle(fontSize: 13, fontWeight: FontWeight.bold);
    final _instansi = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 9, 81, 206),
    );

    String statget(int id) {
      switch (id) {
        case 1:
          return 'Proses';
          break;
        case 2:
          return 'Dipinjam';
          break;
        case 3:
          return 'Ditolak';
          break;
        case 4:
          return 'Dipinjam';
          break;
        case 5:
          return 'Dikembalikan';
          break;
        default:
          return '';
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    barang,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          statget(status),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
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
                  Text('$jumlah Unit', style: subvalue),
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
                    child: Text('Keperluan', style: subtitle),
                  ),
                  const Text(':'),
                  const SizedBox(width: 5),
                  Text(hal, style: subvalue)
                ],
              ),
              const SizedBox(height: 10),
              if (item.status == 1)
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
