import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:inven/app/global/widgets/CustomBG.dart';
import 'package:inven/app/modules/staff/controllers/staff_controller.dart';
import 'package:inven/app/modules/staff/views/pengajuan/AjukanBarang.dart';
import 'package:inven/app/modules/staff/views/pengajuan/AjukanInstansi.dart';
import 'package:inven/app/modules/staff/views/pengajuan/AjukanKembali.dart';
import 'package:inven/app/modules/staff/views/pengajuan/AjukanKeperluan.dart';
import 'package:inven/app/modules/staff/views/pengajuan/AjukanPemohon.dart';
import 'package:inven/app/modules/staff/views/pengajuan/AjukanPinjam.dart';
import 'package:inven/app/modules/staff/views/pengajuan/AjukanUnit.dart';

class StaffAjukanPanel extends GetView<StaffController> {
  const StaffAjukanPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final impl = const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);

    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: CustomBackground(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Informasi Peminjam', style: impl),
                  IconButton(
                    onPressed: () {
                      controller.refresh();
                      controller.resetForm();
                    },
                    icon: Icon(Icons.refresh),
                  ),
                ],
              ),
        
              const SizedBox(height: 8),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: AjukanPemohon()),
        
                  const SizedBox(width: 20),
        
                  Expanded(child: AjukanInstansi()),
                ],
              ),
        
              const SizedBox(height: 10),
        
              AjukanKeperluan(),
        
              const SizedBox(height: 20),
        
              Text('Detail peminjaman', style: impl),
        
              const SizedBox(height: 8),
        
              AjukanBarang(),
        
              const SizedBox(height: 10),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: AjukanPinjam()),
        
                  const SizedBox(width: 20),
        
                  Expanded(child: AjukanKembali()),
                ],
              ),
        
              const SizedBox(height: 20),
        
              Text('Unit barang', style: impl),
        
              const SizedBox(height: 5),
        
              Expanded(child: AjukanUnit()),
            ],
          ),
        ),
      ),
    );
  }
}
