import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_persetujuan.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class PersetujuanPage extends StatefulWidget {
  const PersetujuanPage({super.key});

  @override
  State<PersetujuanPage> createState() => _PersetujuanPageState();
}

class _PersetujuanPageState extends State<PersetujuanPage> {
  final ctrlpersetujuan = Get.put(CtrlPersetujuan());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(title: 'Persetujuan', boldTitle: 'Peminjaman'),
        body: Obx(() {
          if (ctrlpersetujuan.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          if (ctrlpersetujuan.dataPengajuan.isEmpty) {
            return Center(child: Text('Tidak ada data pengajuan'));
          }
          return ListView.builder(
            itemCount: ctrlpersetujuan.dataPengajuan.length,
            itemBuilder: (context, index) {
              final item = ctrlpersetujuan.dataPengajuan[index];

              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(item['nama_barang']??'Barang'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Peminjam: ${item['username']??'-'}'),
                      Text('Instansi: ${item['instansi']??'-'}'),
                      Text('jumlah: ${item['jumlah']??'-'}'),
                      Text('Hal: ${item['hal']??'-'}'),
                      Text('Pengembalian: ${item['tgl_kembali']??'-'}'),
                    ],
                  ),
                  trailing: Icon(Icons.chevron_right),
                ),
              );
            },
          );
        }));
  }
}
