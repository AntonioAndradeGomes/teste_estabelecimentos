import 'package:teste_estabelecimentos/features/establishment/domain/entities/establishment_entity.dart';
import 'package:teste_estabelecimentos/features/establishment/domain/repositories/establishment_repository.dart';
import 'package:teste_estabelecimentos/features/establishment/domain/usercases/get_establishments.dart';

class GetEstablishmentsUseCaseImpl extends GetEstablishmentsUseCase {
  final EstablishmentRepository repository;

  GetEstablishmentsUseCaseImpl({
    required this.repository,
  });

  @override
  Future<List<EstablishmentEntity>> call() async {
    return await repository.getEstablishments();
  }
}
