import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_estabelecimentos/features/establishment/presentation/establishment_controller.dart';
import 'package:teste_estabelecimentos/features/establishment/presentation/widgets/establishment_card.dart';

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
        if (controller.pageState.value == HomeState.loading) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                Theme.of(context).primaryColor,
              ),
            ),
          );
        } else if (controller.pageState.value == HomeState.error) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Erro ao listar os estabelecimentos!',
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
        final list = controller.query.isEmpty
            ? controller.establishments
            : controller.establishmentsFiltered;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: controller.textEditingController,
                onChanged: (text) {
                  controller.query.value = text;
                },
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.clear,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  ),
                  // border: InputBorder.none,
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Pesquisar...',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(
                  16,
                ),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: list.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (_, index) {
                  final item = list[index];
                  return EstablishmentCard(
                    item: item,
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
