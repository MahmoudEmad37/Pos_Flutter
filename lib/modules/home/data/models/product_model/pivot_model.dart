class PivotModel {
  int? productId;
  int? locationId;

  PivotModel({this.productId, this.locationId});

  PivotModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    locationId = json['location_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['location_id'] = this.locationId;
    return data;
  }
}