import 'package:teste_estabelecimentos/features/establishment/data/datasources/remote/establishment/establishment_remote_data_source.dart';
import 'package:teste_estabelecimentos/features/establishment/domain/entities/establishment_entity.dart';
import 'package:teste_estabelecimentos/features/establishment/domain/repositories/establishment_repository.dart';

class EstablishmentRepositoryImpl extends EstablishmentRepository {
  final EstablishmentRemoteDataSource establishmentRemoteDataSource;

  EstablishmentRepositoryImpl({
    required this.establishmentRemoteDataSource,
  });

  @override
  Future<List<EstablishmentEntity>> getEstablishments() async {
    return await establishmentRemoteDataSource.getEstablishments();
  }
}
