import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_estabelecimentos/features/establishment/domain/entities/establishment_entity.dart';
import 'package:teste_estabelecimentos/features/establishment/domain/usercases/get_establishments.dart';

enum HomeState { loading, error, idle }

class EstablishmentController extends GetxController {
  late ScrollController scrollController;
  TextEditingController textEditingController = TextEditingController();
  GetEstablishmentsUseCase getEstablishmentsUseCase;

  RxString query = ''.obs;
  final Rx<HomeState> _pageState = HomeState.loading.obs;
  final RxBool _loading = false.obs;

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

  List<EstablishmentEntity> get listEstablishments {
    if (query.isEmpty) {
      return establishments;
    }
    return establishmentsFiltered;
  }

  HomeState get pageState => _pageState.value;
  bool get loading => _loading.value;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
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
      _pageState.value = HomeState.loading;
      final result = await getEstablishmentsUseCase.call();
      result.sort((EstablishmentEntity a, EstablishmentEntity b) =>
          a.fantasyName.trim().compareTo(b.fantasyName.trim()));
      _establishments.addAll(result);
      _pageState.value = HomeState.idle;
    } catch (e) {
      print(e);
      _pageState.value = HomeState.error;
    }
  }

  Future<void> _queryEstablishments({required String queryText}) async {
    _loading.value = true;
    if (queryText.isNotEmpty) {
      _establishmentsFiltered.clear();
      List<EstablishmentEntity> est = establishments
          .toList()
          .where((element) => element.fantasyName
              .toLowerCase()
              .contains(queryText.toLowerCase()))
          .toList();
      est.sort((EstablishmentEntity a, EstablishmentEntity b) =>
          a.fantasyName.trim().compareTo(b.fantasyName.trim()));
      _establishmentsFiltered.addAll(est);
      _loading.value = false;
    }
    _loading.value = false;
  }
}
