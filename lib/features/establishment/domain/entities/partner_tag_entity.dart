class PartnerTagEntity {
  final int id;
  final int tagsId;
  final int partnerId;
  final int createdBy;
  final String? createdAt;
  final String? deletedAt;
  final String? updatedAt;
  final int situation;

  PartnerTagEntity({
    required this.id,
    required this.tagsId,
    required this.partnerId,
    required this.createdBy,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
    required this.situation,
  });
}
