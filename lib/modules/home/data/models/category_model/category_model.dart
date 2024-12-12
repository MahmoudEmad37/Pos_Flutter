class CategoryModel {
  final int? id;
  final int? businessId;
  final String? name;
  final String? categoryType;

  CategoryModel({
    this.id,
    this.businessId,
    this.name,
    this.categoryType,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'business_id': businessId,
      'name': name,
      'category_type': categoryType,
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'].toInt() as int,
      businessId: json['business_id'].toInt() as int,
      name: json['name'] as String,
      categoryType: json['category_type'] as String,
    );
  }
}
