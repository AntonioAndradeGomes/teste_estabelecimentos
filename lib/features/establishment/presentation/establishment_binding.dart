import 'package:get/get.dart';
import 'package:teste_estabelecimentos/features/establishment/data/datasources/remote/establishment/establishment_remote_data_source.dart';
import 'package:teste_estabelecimentos/features/establishment/data/repositories/establishment_repository.dart';
import 'package:teste_estabelecimentos/features/establishment/domain/repositories/establishment_repository.dart';
import 'package:teste_estabelecimentos/features/establishment/domain/usercases/get_establishments.dart';
import 'package:teste_estabelecimentos/features/establishment/domain/usercases/get_establishments_impl.dart';
import '../data/datasources/remote/establishment/establishment_remote_data_source_impl.dart';
import 'index.dart';

class EstablishmentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EstablishmentRemoteDataSource>(
      () => EstablishmentRemoteDataSourceImpl(
        manager: Get.find(),
      ),
    );
    Get.lazyPut<EstablishmentRepository>(
      () => EstablishmentRepositoryImpl(
        establishmentRemoteDataSource: Get.find(),
      ),
    );
    Get.lazyPut<GetEstablishmentsUseCase>(
      () => GetEstablishmentsUseCaseImpl(
        repository: Get.find(),
      ),
    );
    Get.lazyPut<EstablishmentController>(
      () => EstablishmentController(
        getEstablishmentsUseCase: Get.find(),
      ),
    );
  }
}
