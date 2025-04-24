import 'package:flutter/material.dart';
import 'package:pusdatin_end/widget/custombutton.dart';
import 'package:pusdatin_end/widget/customtxtfield.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final _barangCtrl = TextEditingController();
  final _jumlahCtrl = TextEditingController();
  final _tglKembaliCtrl = TextEditingController();
  final _peminjamCtrl = TextEditingController();
  final _instansiCtrl = TextEditingController();
  final _halCtrl = TextEditingController();
  final _peminjamFocus = FocusNode();
  final _instansiFocus = FocusNode();
  final _halFocus = FocusNode();
  final _barangFocus = FocusNode();
  final _jumlahFocus = FocusNode();
  final _tglKembaliFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final double fieldwidth = MediaQuery.of(context).size.width / 2 - 30;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pengajuan',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              'Peminjaman Barang',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            const SizedBox(height: 25),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    SizedBox(
                      width: fieldwidth,
                      child: CustomTxtField(
                        controller: _peminjamCtrl,
                        label: 'Nama Peminjam',
                        validator: null,
                        keyboardtype: TextInputType.text,
                        obscuretxt: false,
                        focusnode: _peminjamFocus,
                        onfieldsubmitted: (_) {
                          FocusScope.of(context).requestFocus(_instansiFocus);
                        },
                      ),
                    ),
                    SizedBox(
                      width: fieldwidth,
                      child: CustomTxtField(
                        controller: _instansiCtrl,
                        label: 'Instansi',
                        validator: null,
                        keyboardtype: TextInputType.text,
                        obscuretxt: false,
                        focusnode: _instansiFocus,
                        onfieldsubmitted: (_) {
                          FocusScope.of(context).requestFocus(_halFocus);
                        },
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTxtField(
                            controller: _halCtrl,
                            label: 'Hal',
                            validator: null,
                            keyboardtype: TextInputType.text,
                            obscuretxt: false,
                            focusnode: _halFocus,
                            onfieldsubmitted: (_) {
                              FocusScope.of(context).requestFocus(_barangFocus);
                            },
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: fieldwidth,
                      child: CustomTxtField(
                        controller: _barangCtrl,
                        label: 'Nama Barang',
                        validator: null,
                        keyboardtype: TextInputType.text,
                        obscuretxt: false,
                        focusnode: _barangFocus,
                        onfieldsubmitted: (_) {
                          FocusScope.of(context).requestFocus(_jumlahFocus);
                        },
                      ),
                    ),
                    SizedBox(
                      width: fieldwidth,
                      child: CustomTxtField(
                        controller: _jumlahCtrl,
                        label: 'Jumlah Barang',
                        validator: null,
                        keyboardtype: TextInputType.text,
                        obscuretxt: false,
                        focusnode: _jumlahFocus,
                        onfieldsubmitted: (_) {
                          FocusScope.of(context).requestFocus(_tglKembaliFocus);
                        },
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          CustomTxtField(
                            controller: _tglKembaliCtrl,
                            label: 'Tanggal Pengembalian',
                            validator: null,
                            keyboardtype: TextInputType.text,
                            obscuretxt: false,
                            focusnode: _tglKembaliFocus,
                            onfieldsubmitted: (_) {
                              FocusScope.of(context).requestFocus();
                            },
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: fieldwidth,
                        child: CustomButton(
                          onpress: () {},
                          txt: 'Kirim',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
