import 'package:teste_estabelecimentos/features/establishment/data/dtos/establishment_dto.dart';

abstract class EstablishmentRemoteDataSource {
  Future<List<EstablishmentDto>> getEstablishments();
}
