import 'package:teste_estabelecimentos/features/establishment/domain/entities/partner_tag_entity.dart';

class PartnerTagDto extends PartnerTagEntity {
  PartnerTagDto({
    required int id,
    required int tagsId,
    required int partnerId,
    required int createdBy,
    required String? createdAt,
    required String? deletedAt,
    required String? updatedAt,
    required int situation,
  }) : super(
          id: id,
          tagsId: tagsId,
          partnerId: partnerId,
          createdBy: createdBy,
          situation: situation,
          createdAt: createdAt,
          deletedAt: deletedAt,
          updatedAt: updatedAt,
        );

  factory PartnerTagDto.fromMap(Map<String, dynamic> map) => PartnerTagDto(
        id: map['id'],
        tagsId: map['tagsId'],
        partnerId: map['partnerId'],
        createdBy: map['createdBy'],
        createdAt: map['createdAt'],
        deletedAt: map['deletedAt'],
        situation: map['situation'],
        updatedAt: map['updatedAt'],
      );
}
