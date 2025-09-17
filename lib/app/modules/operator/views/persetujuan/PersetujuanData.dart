import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/models/AppPengajuan.dart';
import 'package:inven/app/global/utils/Formatter.dart';
import 'package:inven/app/global/widgets/CustomBtnForm.dart';
import 'package:inven/app/global/widgets/CustomShowDialog.dart';
import 'package:inven/app/modules/operator/controllers/operator_controller.dart';
import 'package:inven/app/modules/operator/views/pemrosesan_panel/proses_pinjam.dart';

class PersetujuanData extends GetView<OperatorController> {
  final int itemId;
  final bool expand;
  final VoidCallback bttn;
  final AppPengajuan model;

  const PersetujuanData({
    required this.itemId,
    required this.expand,
    required this.model,
    required this.bttn,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //informasi pemohon
    final peminjam = model.pengguna?.nama ?? '-';
    final instansi = model.pengguna?.inst ?? '-';
    final keperluan = model.hal ?? '-';

    //detail barang
    final nama_barang = model.unit?.first.barang?.nmBarang ?? '-';
    final merk_barang = model.unit?.first.barang?.merk ?? '-';
    final kode_barang = model.unit?.first.barang?.kdBarang ?? '-';
    final jumlah_unit = model.jumlah.toString();

    //tanggal peminjaman
    final tgl_pinjam = Formatter.dateID(model.pinjamTgl);
    final tgl_kembali = Formatter.dateID(model.kembaliTgl);

    //text style ya ges ya
    final txtIcon = TextStyle(fontSize: 13, color: Colors.grey.shade900);
    final txtTgl = TextStyle(
      fontSize: 13,
      color: Colors.grey.shade900,
      fontWeight: FontWeight.bold,
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //nama barang
                Text(
                  nama_barang,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                Text(
                  merk_barang,
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(kode_barang, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),

        const Divider(),

        const SizedBox(height: 5),

        Row(
          children: [
            const SizedBox(width: 10),
            Icon(Icons.person, size: 15),
            Text(' $peminjam • $instansi', style: txtIcon),
          ],
        ),

        const SizedBox(height: 7),

        //jumlah unit dipinjam
        Row(
          children: [
            const SizedBox(width: 10),
            Icon(Icons.archive, size: 15),
            Text(' $jumlah_unit unit diajukan', style: txtIcon),
          ],
        ),

        const SizedBox(height: 7),

        //status peminjaman
        Row(
          children: [
            const SizedBox(width: 10),
            Icon(Icons.insert_invitation_sharp, size: 15),
            Text(' Peminjaman ', style: txtIcon),
            Text('$tgl_pinjam', style: txtTgl),
          ],
        ),

        const SizedBox(height: 7),

        //tanggal pengembalian
        Row(
          children: [
            const SizedBox(width: 10),
            Icon(Icons.watch_later_sharp, size: 15),
            Text(' Pemulangan ', style: txtIcon),
            Text('$tgl_kembali', style: txtTgl),
          ],
        ),

        const SizedBox(height: 15),

        Row(
          children: [
            Expanded(
              child: TextField(
                controller: TextEditingController(text: keperluan),
                readOnly: true,
                enabled: false,
                maxLines: null,
                style: TextStyle(color: Colors.black, fontSize: 12),
                decoration: InputDecoration(
                  label: Text('Keperluan'),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  isDense: true,
                  disabledBorder: OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 5),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                onPressed: bttn,
                icon: Icon(
                  expand ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        CustomBtnForm(
          label: 'proses',
          isLoading: controller.isBtnLoad.value,
          OnPress: () {
            Get.dialog(
              CustomShowDialog(
                rounded: 36,
                widthFactor: 0.10,
                heightFactor: 0.23,
                child: ProsesPinjam(model: model),
              ),
            );
          },
        ),
      ],
    );
  }
}
