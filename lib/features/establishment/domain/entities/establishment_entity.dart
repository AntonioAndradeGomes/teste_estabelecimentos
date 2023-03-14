import 'package:teste_estabelecimentos/features/establishment/domain/entities/partner_tag_entity.dart';

class EstablishmentEntity {
  final int id;
  final String slug;
  final String fantasyName;
  final String logo;
  final String cover;
  final int discountAmount;
  final int publishedVersion;
  final List<PartnerTagEntity> partnerTags;

  EstablishmentEntity({
    required this.id,
    required this.slug,
    required this.fantasyName,
    required this.logo,
    required this.cover,
    required this.discountAmount,
    required this.publishedVersion,
    required this.partnerTags,
  });

  String get urlLogo => 'https://clube-static.clubegazetadopovo.com.br/$logo';
}
