import 'package:pos_flutter/modules/home/data/models/product_model/variations_model.dart';

class ProductVariationsModel {
  int? id;
  String? name;
  int? productId;
  int? isDummy;
  List<VariationsModel>? variations;

  ProductVariationsModel(
      {this.id,
      this.name,
      this.productId,
      this.isDummy,
      this.variations});

  ProductVariationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productId = json['product_id'];
    isDummy = json['is_dummy'];
    if (json['variations'] != null) {
      variations = <VariationsModel>[];
      json['variations'].forEach((v) {
        variations!.add(new VariationsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['product_id'] = this.productId;
    data['is_dummy'] = this.isDummy;
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}