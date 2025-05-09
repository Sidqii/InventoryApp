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
  void dispose() {
    _barangCtrl.dispose();
    _jumlahCtrl.dispose();
    _tglKembaliCtrl.dispose();
    _peminjamCtrl.dispose();
    _instansiCtrl.dispose();
    _halCtrl.dispose();
    _pengajuanTotalCtrl.dispose();
    _barangFocus.dispose();
    _jumlahFocus.dispose();
    _tglKembaliFocus.dispose();
    _peminjamFocus.dispose();
    _instansiFocus.dispose();
    _halFocus.dispose();
    _pengajuanTotalFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        shadowColor: Colors.black.withValues(alpha: 5),
        title: const Row(
          children: const [
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 40,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(4.0, 4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Informasi Peminjam:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: CustomTxtField(
                      controller: _peminjamCtrl,
                      label: 'Peminjam',
                      validator: null,
                      keyboardtype: TextInputType.text,
                      obscuretxt: false,
                      focusnode: _peminjamFocus,
                      onfieldsubmitted: (_) {
                        FocusScope.of(context).requestFocus(_instansiFocus);
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
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
                ],
              ),
              const SizedBox(height: 10),
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
              const SizedBox(height: 40),
              const Text(
                'Detail Barang:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: CustomTxtField(
                      controller: _barangCtrl,
                      label: 'Barang',
                      validator: null,
                      keyboardtype: TextInputType.text,
                      obscuretxt: false,
                      focusnode: _barangFocus,
                      onfieldsubmitted: (_) {
                        FocusScope.of(context).requestFocus(_jumlahFocus);
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomTxtField(
                      controller: _jumlahCtrl,
                      label: 'Jumlah',
                      validator: null,
                      keyboardtype: TextInputType.text,
                      obscuretxt: false,
                      focusnode: _jumlahFocus,
                      onfieldsubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_tglKembaliFocus);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomTxtField(
                controller: _tglKembaliCtrl,
                label: 'Pengembalian',
                validator: null,
                keyboardtype: TextInputType.text,
                obscuretxt: false,
                focusnode: _tglKembaliFocus,
                onfieldsubmitted: (_) {
                  print('Kirim');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
        child: CustomButton(
          onpress: () {
            print('kirim');
          },
          txt: 'kirim',
        ),
      ),
    );
  }
}
