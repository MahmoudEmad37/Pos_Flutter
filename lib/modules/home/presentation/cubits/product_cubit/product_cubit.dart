import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/modules/home/domain/repositories/product_repo/product_repo.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/product_cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo _productRepo;

  ProductCubit(this._productRepo) : super(InitState());

  static ProductCubit get(context, {bool listen = false}) =>
      BlocProvider.of<ProductCubit>(context, listen: listen);
  // List<ProductModel> products = [];

  getAllProducts({required int page, String? categoryId, String? brandId}) async {
    emit(GetProductLoadingState());
    final result = await _productRepo.getProducts(page: page,categoryId: categoryId, brandId: brandId);
    result.fold((data) {
      emit(GetProductSuccessState(data));
    }, (failure) => emit(GetProductErrorState(failure.toString())));
  }
}
