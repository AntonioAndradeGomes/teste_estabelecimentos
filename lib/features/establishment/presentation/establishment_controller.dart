import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:teste_estabelecimentos/features/establishment/domain/entities/establishment_entity.dart';
import 'package:teste_estabelecimentos/features/establishment/domain/usercases/get_establishments.dart';

enum HomeState { loading, error, idle }

class EstablishmentController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxString query = ''.obs;
  GetEstablishmentsUseCase getEstablishmentsUseCase;
  Rx<HomeState> pageState = HomeState.loading.obs;

  final RxList<EstablishmentEntity> _establishments =
      <EstablishmentEntity>[].obs;
  final RxList<EstablishmentEntity> _establishmentsFiltered =
      <EstablishmentEntity>[].obs;

  EstablishmentController({
    required this.getEstablishmentsUseCase,
  });

  List<EstablishmentEntity> get establishments => _establishments.toList();
  List<EstablishmentEntity> get establishmentsFiltered =>
      _establishmentsFiltered.toList();

  @override
  void onInit() {
    super.onInit();
    initList();
    debounce(
      query,
      (_) => _queryEstablishments(
        queryText: query.value,
      ),
    );
  }

  Future<void> initList() async {
    try {
      pageState.value = HomeState.loading;
      final result = await getEstablishmentsUseCase.call();
      result.sort((EstablishmentEntity a, EstablishmentEntity b) =>
          a.fantasyName.trim().compareTo(b.fantasyName.trim()));
      _establishments.addAll(result);
      pageState.value = HomeState.idle;
    } catch (e) {
      print(e);
      pageState.value = HomeState.error;
    }
  }

  _queryEstablishments({required String queryText}) {
    _establishmentsFiltered.clear();
    if (queryText.isNotEmpty) {
      List<EstablishmentEntity> est = establishments
          .toList()
          .where((element) => element.fantasyName
              .toLowerCase()
              .contains(queryText.toLowerCase()))
          .toList();
      est.sort((EstablishmentEntity a, EstablishmentEntity b) =>
          a.fantasyName.trim().compareTo(b.fantasyName.trim()));
      _establishmentsFiltered.addAll(est);
    }
  }
}
