// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';


class ProdeuctModel {
  int? id;
  String? name;
  String? price;
  int? quantity;

  ProdeuctModel({
    this.id,
    this.name,
    this.price,
    this.quantity,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  factory ProdeuctModel.fromMap(Map<String, dynamic> map) {
    return ProdeuctModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdeuctModel.fromJson(String source) => ProdeuctModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
