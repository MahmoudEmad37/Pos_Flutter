import 'package:get_it/get_it.dart';
import 'package:pos_flutter/modules/home/domain/repositories/brand_repo/brand_repo.dart';
import 'package:pos_flutter/modules/home/domain/repositories/category_repo/category_repo.dart';
import 'package:pos_flutter/modules/home/domain/repositories/contact_repo/contact_repo.dart';
import 'package:pos_flutter/modules/home/domain/repositories/product_repo/product_repo.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static init() {
    sl.registerLazySingleton<BrandRepo>(() => BrandRepo());
    sl.registerLazySingleton<CategoryRepo>(() => CategoryRepo());
    sl.registerLazySingleton<ProductRepo>(() => ProductRepo());
    sl.registerLazySingleton<ContactRepo>(() => ContactRepo());
  }
}
