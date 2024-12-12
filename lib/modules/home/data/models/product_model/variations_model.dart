import 'package:pos_flutter/modules/home/data/models/product_model/variation_location_details_model.dart';

class VariationsModel {
  int? id;
  String? name;
  int? productId;
  String? subSku;
  int? productVariationId;
  double? defaultPurchasePrice;
  String? dppIncTax;
  String? profitPercent;
  String? defaultSellPrice;
  String? sellPriceIncTax;
  List<VariationLocationDetailsModel>? variationLocationDetails;

  VariationsModel({
    this.id,
    this.name,
    this.productId,
    this.subSku,
    this.productVariationId,
    this.defaultPurchasePrice,
    this.dppIncTax,
    this.profitPercent,
    this.defaultSellPrice,
    this.sellPriceIncTax,
    this.variationLocationDetails,
  });

  VariationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productId = json['product_id'];
    subSku = json['sub_sku'];
    productVariationId = json['product_variation_id'];
    defaultPurchasePrice = double.parse(json['default_purchase_price']) ?? 0;
    dppIncTax = json['dpp_inc_tax'];
    profitPercent = json['profit_percent'];
    defaultSellPrice = json['default_sell_price'];
    sellPriceIncTax = json['sell_price_inc_tax'];
    if (json['variation_location_details'] != null) {
      variationLocationDetails = <VariationLocationDetailsModel>[];
      json['variation_location_details'].forEach((v) {
        variationLocationDetails!
            .add(new VariationLocationDetailsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['product_id'] = this.productId;
    data['sub_sku'] = this.subSku;
    data['product_variation_id'] = this.productVariationId;
    data['default_purchase_price'] = this.defaultPurchasePrice.toString();
    data['dpp_inc_tax'] = this.dppIncTax;
    data['profit_percent'] = this.profitPercent;
    data['default_sell_price'] = this.defaultSellPrice;
    data['sell_price_inc_tax'] = this.sellPriceIncTax;
    if (this.variationLocationDetails != null) {
      data['variation_location_details'] =
          this.variationLocationDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
