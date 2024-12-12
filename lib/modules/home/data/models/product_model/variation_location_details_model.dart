class VariationLocationDetailsModel {
  int? id;
  int? productId;
  int? productVariationId;
  int? variationId;
  int? locationId;
  double? qtyAvailable;

  VariationLocationDetailsModel({
    this.id,
    this.productId,
    this.productVariationId,
    this.variationId,
    this.locationId,
    this.qtyAvailable,
  });

  VariationLocationDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productVariationId = json['product_variation_id'];
    variationId = json['variation_id'];
    locationId = json['location_id'];
    qtyAvailable = double.parse(json['qty_available']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['product_variation_id'] = this.productVariationId;
    data['variation_id'] = this.variationId;
    data['location_id'] = this.locationId;
    data['qty_available'] = this.qtyAvailable.toString();
    return data;
  }
}
