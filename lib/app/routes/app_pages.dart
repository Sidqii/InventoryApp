import 'package:get/get.dart';

import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/atasan/bindings/atasan_binding.dart';
import '../modules/atasan/views/atasan_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/operator/bindings/operator_binding.dart';
import '../modules/operator/views/operator_view.dart';
import '../modules/public/bindings/public_binding.dart';
import '../modules/public/views/public_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/staff/bindings/staff_binding.dart';
import '../modules/staff/views/staff_view.dart';
import '../modules/teknisi/bindings/teknisi_binding.dart';
import '../modules/teknisi/views/teknisi_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.OPERATOR,
      page: () => const OperatorView(),
      binding: OperatorBinding(),
    ),
    GetPage(
      name: _Paths.STAFF,
      page: () => const StaffView(),
      binding: StaffBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => const AdminView(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.PUBLIC,
      page: () => const PublicView(),
      binding: PublicBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.TEKNISI,
      page: () => const TeknisiView(),
      binding: TeknisiBinding(),
    ),
    GetPage(
      name: _Paths.ATASAN,
      page: () => const AtasanView(),
      binding: AtasanBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
