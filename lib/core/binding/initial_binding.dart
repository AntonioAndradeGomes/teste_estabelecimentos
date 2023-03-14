import 'package:get/get.dart';
import 'package:teste_estabelecimentos/core/services/http_manager.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HttpManager>(
      HttpManager(),
    );
  }
}
