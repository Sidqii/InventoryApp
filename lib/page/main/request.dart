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
  final _pengajuanTotalCtrl = TextEditingController();
  final _peminjamFocus = FocusNode();
  final _instansiFocus = FocusNode();
  final _halFocus = FocusNode();
  final _barangFocus = FocusNode();
  final _jumlahFocus = FocusNode();
  final _tglKembaliFocus = FocusNode();
  final _pengajuanTotalFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final double fieldwidth = MediaQuery.of(context).size.width / 2 - 30;
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        shadowColor: Colors.black.withValues(alpha: 5),
        title: const Row(
          children: [
            Text(
              'Pengajuan',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(width: 1),
            Text(
              'Barang',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_sharp,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 30,
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
                      child: CustomTxtField(
                        controller: _tglKembaliCtrl,
                        label: 'Tanggal Pengembalian',
                        validator: null,
                        keyboardtype: TextInputType.text,
                        obscuretxt: false,
                        focusnode: _tglKembaliFocus,
                        onfieldsubmitted: (_) {
                          print('Kirim');
                        },
                      ),
                    ),
                    SizedBox(width: fieldwidth),
                    SizedBox(
                      width: fieldwidth,
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          CustomTxtField(
                            controller: _pengajuanTotalCtrl,
                            label: 'Total Pengajuan',
                            validator: null,
                            keyboardtype: TextInputType.text,
                            obscuretxt: false,
                            focusnode: _pengajuanTotalFocus,
                            onfieldsubmitted: (_) {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  child: CustomButton(
                    onpress: () {},
                    txt: 'kirim',
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
