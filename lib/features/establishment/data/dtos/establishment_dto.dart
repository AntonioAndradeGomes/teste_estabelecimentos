import 'package:teste_estabelecimentos/features/establishment/data/dtos/partner_tag_dto.dart';
import 'package:teste_estabelecimentos/features/establishment/domain/entities/establishment_entity.dart';

class EstablishmentDto extends EstablishmentEntity {
  EstablishmentDto({
    required int id,
    required String slug,
    required String fantasyName,
    required String logo,
    required String cover,
    required int discountAmount,
    required int publishedVersion,
    required List<PartnerTagDto> partnerTags,
  }) : super(
          id: id,
          slug: slug,
          fantasyName: fantasyName,
          logo: logo,
          cover: cover,
          discountAmount: discountAmount,
          publishedVersion: publishedVersion,
          partnerTags: partnerTags,
        );

  factory EstablishmentDto.fromMap(Map<String, dynamic> map) =>
      EstablishmentDto(
        id: map['id'],
        slug: map['slug'],
        fantasyName: map['fantasyName'],
        logo: map['logo'],
        cover: map['cover'],
        discountAmount: map['discountAmount'],
        publishedVersion: map['publishedVersion'],
        partnerTags: List<Map<String, dynamic>>.from(map['PartnerTags'])
            .map((e) => PartnerTagDto.fromMap(e))
            .toList(),
      );
}
