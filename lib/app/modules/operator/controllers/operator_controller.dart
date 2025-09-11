import 'package:get/get.dart';
import 'package:inven/app/data/models/AppPengajuan.dart';
import 'package:inven/app/data/models/AppUser.dart';
import 'package:inven/app/data/services/services_get.dart';
import 'package:inven/app/global/controllers/global_user_controller.dart';
import 'package:inven/app/modules/login/controllers/login_controller.dart';
import 'package:inven/app/modules/login/views/login_view.dart';

class OperatorController extends GetxController {
  final userCtrl = Get.find<GlobalUserController>();
  final services = ServicesGet();

  AppUser? get userData => userCtrl.user.value;

  final isExpand = ''.obs; //pemantauan expand

  var isBtnLoad = false.obs; //loading indikator
  var isLoading = false.obs; //loading value

  final pengajuan = <AppPengajuan>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void doLogout() {
    Get.offAll(
      () => LoginView(),
      binding: BindingsBuilder(() {
        Get.put(GlobalUserController());
        Get.put(LoginController());
      }),
    );
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;

      final dataPengajuan = await services.indexApp();

      pengajuan.assignAll(dataPengajuan);
    } catch (e) {
      Get.snackbar('Error', 'Error fetch data controller');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
