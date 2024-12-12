class BrandModel {
  final int? id;
  final int? businessId;
  final String? name;

  BrandModel({
    this.id,
    this.businessId,
    this.name,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'business_id': businessId,
      'name': name,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'].toInt() as int,
      businessId: json['business_id'].toInt() as int,
      name: json['name'] as String,
    );
  }
}
