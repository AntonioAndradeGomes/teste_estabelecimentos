import 'package:get/get.dart';
import 'package:teste_estabelecimentos/core/config/routes/app_routes.dart';

class SplashController extends GetxController {
  Future<void> toPage() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    Get.offNamed(
      AppRoutes.HOME,
    );
  }
}
