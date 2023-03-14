import 'package:flutter/material.dart';
import 'package:teste_estabelecimentos/features/establishment/domain/entities/establishment_entity.dart';
import 'package:teste_estabelecimentos/features/establishment/presentation/widgets/establishment_card.dart';

class GeneralListWidget extends StatelessWidget {
  final List<EstablishmentEntity> elements;
  final ScrollController scrollController;

  const GeneralListWidget({
    Key? key,
    required this.elements,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return elements.isEmpty
        ? const Text(
            'Não há estabelecimentos com a chave de busca.',
          )
        : Expanded(
            child: Scrollbar(
              thickness: 8,
              thumbVisibility: true,
              radius: const Radius.circular(10),
              interactive: true,
              trackVisibility: false,
              controller: scrollController,
              child: GridView.builder(
                controller: scrollController,
                padding: const EdgeInsets.all(
                  16,
                ),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: elements.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (_, index) {
                  final item = elements[index];
                  return EstablishmentCard(
                    item: item,
                  );
                },
              ),
            ),
          );
  }
}
