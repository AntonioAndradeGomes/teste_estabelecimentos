import 'package:get/get.dart';
import 'package:teste_estabelecimentos/core/config/routes/app_routes.dart';
import 'package:teste_estabelecimentos/features/establishment/presentation/index.dart';
import 'package:teste_estabelecimentos/features/splash/index.dart';

abstract class AppPages {
  static const INITIAL = AppRoutes.SPLASH;

  static final List<GetPage> pages = <GetPage>[
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => EstablishmentPage(),
      binding: EstablishmentBinding(),
    ),
  ];
}
