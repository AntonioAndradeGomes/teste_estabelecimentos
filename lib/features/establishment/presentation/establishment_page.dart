import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_estabelecimentos/features/establishment/presentation/establishment_controller.dart';
import 'package:teste_estabelecimentos/features/establishment/presentation/widgets/general_list_widget.dart';
import 'package:teste_estabelecimentos/features/establishment/presentation/widgets/search_widget.dart';

class EstablishmentPage extends StatelessWidget {
  final controller = Get.find<EstablishmentController>();
  EstablishmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Estabelecimentos',
        ),
      ),
      body: Obx(() {
        if (controller.pageState == HomeState.loading) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                Theme.of(context).primaryColor,
              ),
            ),
          );
        } else if (controller.pageState == HomeState.error) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Erro ao trazer a lista de estabelecimentos!',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.initList();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text(
                    'Tente novamente',
                  ),
                ),
              ],
            ),
          );
        }
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Column(
            children: [
              SearchWidget(
                textEditingController: controller.textEditingController,
                onChanged: (text) {
                  controller.filterList(text);
                },
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.textEditingController.clear();
                  controller.filterList('');
                },
              ),
              GeneralListWidget(
                elements: controller.establishmentsFiltered,
                scrollController: controller.scrollController,
              ),
            ],
          ),
        );
      }),
    );
  }
}
