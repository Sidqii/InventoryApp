import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/controller/operator/CtrlEditInven.dart';
import 'package:pusdatin_end/interface/operator/EditCatatanBarang.dart';
import 'package:pusdatin_end/interface/operator/EditDeskripsiBarang.dart';
import 'package:pusdatin_end/interface/operator/EditGaransiBarang.dart';
import 'package:pusdatin_end/interface/operator/EditJenisBarang.dart';
import 'package:pusdatin_end/interface/operator/EditMerkBarang.dart';
import 'package:pusdatin_end/interface/operator/EditNamaBarang.dart';
import 'package:pusdatin_end/interface/operator/EditPengadaanBarang.dart';
import 'package:pusdatin_end/interface/operator/EditSpesifikasiBarang.dart';
import 'package:pusdatin_end/interface/operator/EditTanggalBarang.dart';
import 'package:pusdatin_end/interface/operator/EditVendorBarang.dart';
import 'package:pusdatin_end/model/app_barang.dart';
import 'package:pusdatin_end/widget/custombutton.dart';

class EditPanel extends StatelessWidget {
  final AppBarangModel data;
  final ctrl = Get.find<CtrlEditInven>();

  EditPanel({
    required this.data,
    super.key,
  }) {
    ctrl.init(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Edit data barang',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.red.shade300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
              ),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    EditNamaBarang(),
                    const SizedBox(height: 8),
                    EditJenisBarang(),
                    const SizedBox(height: 8),
                    EditMerkBarang(),
                    const SizedBox(height: 8),
                    EditPengadaanBarang(),
                    const SizedBox(height: 8),
                    EditGaransiBarang(),
                    const SizedBox(height: 8),
                    EditVendorBarang(),
                    const SizedBox(height: 9),
                    EditTanggalBarang(),
                    const SizedBox(height: 8),
                    EditDeskripsiBarang(),
                    const SizedBox(height: 8),
                    EditCatatanBarang(),
                    const SizedBox(height: 20),
                    EditSpesifikasiBarang()
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 130,
                  child: CustomButton(
                    onpress: () {
                      if (!ctrl.validate()) {
                        return;
                      }
                      if (!ctrl.checkChanges()) {
                        Get.back();
                        return;
                      }
                      showDialog(
                        context: Get.context!,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            child: IntrinsicWidth(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 18,
                                  left: 18,
                                  right: 18,
                                  bottom: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xffFBFBFB),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Yakin ingin menyimpan perubahan?',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          height: 30,
                                          child: CustomButton(
                                            onpress: () async {
                                              Get.back();
                                              await ctrl.patch();
                                            },
                                            txt: 'Ya',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    txt: 'Simpan',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
