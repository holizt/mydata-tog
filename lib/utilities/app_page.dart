import 'package:get/get.dart';
import '../pages/add_profil_page.dart';
import '../pages/home_pages.dart';
import '../utilities/app_routes.dart';

abstract class AppPages {
  static const initial = Routes.home;
  static final routes = [
    GetPage(name: Routes.home, page: () => HomePage()),
    GetPage(name: Routes.profil, page: () => const AddProfilPage()),
  ];
}
