import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_estabelecimentos/core/binding/initial_binding.dart';
import 'package:teste_estabelecimentos/core/config/routes/app_pages.dart';
import 'package:teste_estabelecimentos/core/config/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Estabelecimentos App",
      getPages: AppPages.pages,
      initialRoute: AppPages.INITIAL,
      theme: globalTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
    );
  }
}
