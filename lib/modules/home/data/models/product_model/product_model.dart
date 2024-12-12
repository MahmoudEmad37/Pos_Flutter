import 'package:pos_flutter/modules/home/data/models/Category_model/Category_model.dart';
import 'package:pos_flutter/modules/home/data/models/brand_model/brand_model.dart';
import 'package:pos_flutter/modules/home/data/models/product_model/Product_variations_model.dart';
import 'package:pos_flutter/modules/home/data/models/product_model/product_locations_model.dart';
import 'package:pos_flutter/modules/home/data/models/product_model/unit_model.dart';

class ProductModel {
  int? id;
  String? name;
  int? businessId;
  String? type;
  int? enableStock;
  String? alertQuantity;
  String? sku;
  String? barcodeType;
  int? enableSrNo;
  String? image;
  int? createdBy;
  int? isInactive;
  int? notForSelling;
  String? imageUrl;
  List<ProductVariationsModel>? productVariations;
  BrandModel? brand;
  UnitModel? unit;
  CategoryModel? category;
  List<ProductLocationsModel>? productLocations;

  ProductModel(
      {this.id,
      this.name,
      this.businessId,
      this.type,
      this.enableStock,
      this.alertQuantity,
      this.sku,
      this.barcodeType,
      this.enableSrNo,
      this.image,
      this.createdBy,
      this.isInactive,
      this.notForSelling,
      this.imageUrl,
      this.productVariations,
      this.brand,
      this.unit,
      this.category,
      this.productLocations});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    businessId = json['business_id'];
    type = json['type'];
    enableStock = json['enable_stock'];
    alertQuantity = json['alert_quantity'];
    sku = json['sku'];
    barcodeType = json['barcode_type'];
    enableSrNo = json['enable_sr_no'];
    image = json['image'];
    createdBy = json['created_by'];
    isInactive = json['is_inactive'];
    notForSelling = json['not_for_selling'];
    imageUrl = json['image_url'];
    if (json['product_variations'] != null) {
      productVariations = <ProductVariationsModel>[];
      json['product_variations'].forEach((v) {
        productVariations!.add(new ProductVariationsModel.fromJson(v));
      });
    }
    brand = json['brand'] != null ? new BrandModel.fromJson(json['brand']) : null;
    unit = json['unit'] != null ? new UnitModel.fromJson(json['unit']) : null;
    category = json['category'] != null
        ? new CategoryModel.fromJson(json['category'])
        : null;
  
    if (json['product_locations'] != null) {
      productLocations = <ProductLocationsModel>[];
      json['product_locations'].forEach((v) {
        productLocations!.add(new ProductLocationsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['business_id'] = this.businessId;
    data['type'] = this.type;
    
    data['enable_stock'] = this.enableStock;
    data['alert_quantity'] = this.alertQuantity;
    data['sku'] = this.sku;
    data['barcode_type'] = this.barcodeType;
   
    data['enable_sr_no'] = this.enableSrNo;
    
    data['image'] = this.image;

    data['created_by'] = this.createdBy;

    data['is_inactive'] = this.isInactive;
    data['not_for_selling'] = this.notForSelling;
    data['image_url'] = this.imageUrl;
    if (this.productVariations != null) {
      data['product_variations'] =
          this.productVariations!.map((v) => v.toJson()).toList();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.unit != null) {
      data['unit'] = this.unit!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
 
    if (this.productLocations != null) {
      data['product_locations'] =
          this.productLocations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}