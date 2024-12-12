class UnitModel {
  int? id;
  int? businessId;
  String? actualName;
  String? shortName;
  int? allowDecimal;

  UnitModel({
    this.id,
    this.businessId,
    this.actualName,
    this.shortName,
    this.allowDecimal,
  });

  UnitModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessId = json['business_id'];
    actualName = json['actual_name'];
    shortName = json['short_name'];
    allowDecimal = json['allow_decimal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_id'] = this.businessId;
    data['actual_name'] = this.actualName;
    data['short_name'] = this.shortName;
    data['allow_decimal'] = this.allowDecimal;

    return data;
  }
}
