import 'package:flutter/material.dart';
import 'package:pusdatin_end/model/app_persetujuan.dart';
import 'package:pusdatin_end/utils/Formatter.dart';

class CardApprvHeader extends StatelessWidget {
  final AppPersetujuanModel apprv;

  const CardApprvHeader({
    required this.apprv,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //info barang
    final barang = apprv.modelunit?.produk?.barang ?? '';
    final kode = apprv.modelunit?.produk?.kode ?? '';
    final merk = apprv.modelunit?.produk?.merk ?? '';

    //info pemohon
    final nama = apprv.namapeminjam ?? '';
    final insi = apprv.modelreqq?.instansi ?? '';
    final back = Formatter.dateID(apprv.modelreqq?.kembali ?? '');
    final juml = apprv.modelreqq?.jumlah?.toString() ?? '0';

    //info disetujui
    final aprv = Formatter.dateID(apprv.tanggal);
    final stts = apprv.modeljenis?.label ?? '';

    //text style
    final title = const TextStyle(
      fontSize: 13,
    );
    final subtitle = const TextStyle(
      fontSize: 13,
    );
    final titleval = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              //informasi barang
              Text(barang, style: title),
              Text(merk, style: subtitle),
              Text(kode, style: subtitle),
              Divider(thickness: 1),

              //status persetujuan
              Row(
                children: [
                  Text(stts),
                  const Text(' | '),
                  Text(aprv, style: titleval),
                ],
              ),

              //informasi peminjam
              Row(
                children: [
                  SizedBox(
                    width: 135,
                    child: Text('Pemohon'),
                  ),
                  const Text(':  '),
                  Text(nama),
                  const Text(' | '),
                  Text(insi),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 135,
                    child: Text('Sampai tanggal'),
                  ),
                  const Text(':  '),
                  Text(back),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 135,
                    child: Text('Jumlah barang'),
                  ),
                  const Text(':  '),
                  Text(juml),
                ],
              ),
              // Row(
              //   children: [],
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
