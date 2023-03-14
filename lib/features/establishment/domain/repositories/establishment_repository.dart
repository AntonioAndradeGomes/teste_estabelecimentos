import 'package:teste_estabelecimentos/features/establishment/domain/entities/establishment_entity.dart';

abstract class EstablishmentRepository {
  Future<List<EstablishmentEntity>> getEstablishments();
}
