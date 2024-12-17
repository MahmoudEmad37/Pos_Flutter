import 'package:pos_flutter/modules/home/data/models/brand_model/brand_model.dart';

abstract class BrandState {}

class InitState extends BrandState {}

class GetBrandLoadingState extends BrandState {}

class GetBrandSuccessState extends BrandState {
  final List<BrandModel> brands;

   GetBrandSuccessState(this.brands);
}

class GetBrandErrorState extends BrandState {
  final String message;

   GetBrandErrorState(this.message);
}
