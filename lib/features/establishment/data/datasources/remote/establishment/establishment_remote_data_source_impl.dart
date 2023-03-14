import 'package:teste_estabelecimentos/core/errors/failure.dart';
import 'package:teste_estabelecimentos/core/services/http_manager.dart';
import 'package:teste_estabelecimentos/features/establishment/data/datasources/remote/establishment/establishment_remote_data_source.dart';
import 'package:teste_estabelecimentos/features/establishment/data/dtos/establishment_dto.dart';

class EstablishmentRemoteDataSourceImpl extends EstablishmentRemoteDataSource {
  final HttpManager manager;
  final BASEURL =
      'https://gdp-prd-clube.s3.amazonaws.com/api/repository/partners/all.json';
  EstablishmentRemoteDataSourceImpl({
    required this.manager,
  });

  @override
  Future<List<EstablishmentDto>> getEstablishments() async {
    final response = await manager.restRequestList(
      url: BASEURL,
      method: HttpMethods.get,
    );

    if (!response.containsKey('results')) {
      throw Failure.fromMap(response);
    }
    return (response['results'] as List)
        .map((e) => EstablishmentDto.fromMap(e))
        .toList();
  }
}
