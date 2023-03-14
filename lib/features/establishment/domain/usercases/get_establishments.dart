import 'package:teste_estabelecimentos/features/establishment/domain/entities/establishment_entity.dart';

abstract class GetEstablishmentsUseCase {
  Future<List<EstablishmentEntity>> call();
}
