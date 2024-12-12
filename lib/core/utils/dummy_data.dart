import 'package:pos_flutter/modules/home/data/models/prodeuct_moel.dart';
import 'package:pos_flutter/modules/home/domain/entities/product_entity.dart';

class DummyData {
  static List<String> brandsList = [
    'الكل',
    'Item1Item1Item1',
    'Item2',
    'Item3'
  ];
  
  static List<String> itemsList = ['الكل', 'Item4', 'Item5', 'Item6'];

  static List<ProductEntity> productsList = [
    ProductEntity(
        id: 1, name: "مويبل وان 4 لتر 5/30", price: '2000.0', quantity: 10),
    ProductEntity(
        id: 2, name: "مويبل وان 4 لتر 5/40", price: '2000.0', quantity: 8),
    ProductEntity(
        id: 3, name: "مويبل وان 4 لتر 5/50", price: '2000.0', quantity: 20),
    ProductEntity(
        id: 4,
        name: "موبيل سوبر 2000 - 1 لتر 5/30",
        price: '1015.0',
        quantity: 0),
    ProductEntity(
        id: 5,
        name: "موبيل وان دلفاك 5 لتر - HSC",
        price: '1770.0',
        quantity: 15),
    ProductEntity(
        id: 6,
        name: "موبيل دلفاك 1 لتر الاسطورة - 1350",
        price: '180.0.0',
        quantity: 0),
    ProductEntity(
        id: 7,
        name: "شحن فريون شحن فريون شحن فريون شحن فريون شحن فريون شحن فريون",
        price: '800.0',
        quantity: 15),
  ];
}
