import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/modules/home/data/models/product_model/product_model.dart';
import 'package:pos_flutter/modules/home/domain/repositories/product_repo/product_repo.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/product_cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo _productRepo;

  ProductCubit(this._productRepo) : super(InitState());

  static ProductCubit get(context, {bool listen = false}) =>
      BlocProvider.of<ProductCubit>(context, listen: listen);
  List<ProductModel> products = [];

  getAllProducts({required int page}) async {
    emit(GetProductLoadingState());
    final result = await _productRepo.getAllProducts(page: page);
    result.fold((l) {
      final allProducts = l.data["data"];
      if (allProducts != null) {
        products = allProducts
            .map<ProductModel>((e) => ProductModel.fromJson(e))
            .toList();
      }
      print("${products.length} + 11111111111");
      emit(GetProductSuccessState());
    }, (r) => emit(GetProductErrorState()));
  }
}
