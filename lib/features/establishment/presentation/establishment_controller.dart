import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_estabelecimentos/features/establishment/domain/entities/establishment_entity.dart';
import 'package:teste_estabelecimentos/features/establishment/domain/usercases/get_establishments.dart';

enum HomeState { loading, error, idle }

class EstablishmentController extends GetxController {
  //controller do movimento da ListView
  late ScrollController scrollController;
  //controller do textfield
  TextEditingController textEditingController = TextEditingController();
  //usecase
  GetEstablishmentsUseCase getEstablishmentsUseCase;

  //reatividade do estado da pagina
  final Rx<HomeState> _pageState = HomeState.loading.obs;

  //lista de estabelecimentos -> retorno da api
  final RxList<EstablishmentEntity> _establishments =
      <EstablishmentEntity>[].obs;
  //lista de estabelecimentos, incialmente retorno da api, lista filtrada
  final RxList<EstablishmentEntity> _establishmentsFiltered =
      <EstablishmentEntity>[].obs;

  List<EstablishmentEntity> get establishmentsFiltered =>
      _establishmentsFiltered.toList();

  HomeState get pageState => _pageState.value;

  //construtor
  EstablishmentController({
    required this.getEstablishmentsUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    initList();
  }

  Future<void> initList() async {
    try {
      _pageState.value = HomeState.loading;
      final result = await getEstablishmentsUseCase.call();
      result.sort((EstablishmentEntity a, EstablishmentEntity b) =>
          a.fantasyName.trim().compareTo(b.fantasyName.trim()));
      _establishments.addAll(result);
      _establishmentsFiltered.addAll(result);
      _pageState.value = HomeState.idle;
    } catch (e) {
      print(e);
      _pageState.value = HomeState.error;
    }
  }

  void filterList(String text) {
    List<EstablishmentEntity> result = [];
    if (text.isEmpty) {
      result = _establishments.toList();
    } else {
      result = _establishments
          .toList()
          .where((element) =>
              element.fantasyName.toLowerCase().contains(text.toLowerCase()))
          .toList();
      result.sort((EstablishmentEntity a, EstablishmentEntity b) =>
          a.fantasyName.trim().compareTo(b.fantasyName.trim()));
    }
    _establishmentsFiltered.assignAll(result);
  }
}
