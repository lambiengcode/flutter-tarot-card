import 'package:flutter_getx_template/src/app.dart';
import 'package:flutter_getx_template/src/pages/home/details_page.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: Routes.ROOT,
      page: () => App(),
      children: [],
    ),
    GetPage(
      name: Routes.DETAILS,
      page: () => DetailsPage(
        results: Get.arguments,
      ),
      children: [],
    ),
  ];
}
