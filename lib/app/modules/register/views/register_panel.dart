import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inven/app/data/services/base_url.dart';
import 'package:inven/app/global/widgets/CustomAppBar.dart';
import 'package:inven/app/global/widgets/CustomBtnForm.dart';
import 'package:inven/app/modules/register/controllers/register_controller.dart';
import 'package:inven/app/routes/app_pages.dart';

class RegisterPanel extends GetView<RegisterController> {
  const RegisterPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final urlController = TextEditingController(text: BaseUrl.url);

    return Column(
      children: [
        CustomAppbar(title: 'Konfigurasi', boldTitle: 'URL', showNotif: false),

        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade50,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              TextField(
                cursorColor: Colors.black,
                controller: urlController,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                  labelText: 'Domain',
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              CustomBtnForm(
                label: 'konfigurasi',
                OnPress: () {
                  BaseUrl.setUrl(urlController.text.trim());

                  Get.snackbar('Sukses', 'Konfigurasi URL berhasil');

                  Get.offAllNamed(Routes.LOGIN);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
