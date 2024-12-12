import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/modules/home/data/models/Category_model/Category_model.dart';
import 'package:pos_flutter/modules/home/domain/repositories/category_repo/category_repo.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/category_cubit.dart/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo _CategoryRepo;

  CategoryCubit(this._CategoryRepo) : super(InitState());

  static CategoryCubit get(context, {bool listen = false}) =>
      BlocProvider.of<CategoryCubit>(context, listen: listen);
  List<CategoryModel> categories = [];

  getAllCategories() async {
    emit(GetCategoryLoadingState());
    final result = await _CategoryRepo.getAllCategories();
    result.fold((l) {
      final allCategories = l.data["data"];
      if (allCategories != null) {
        categories=allCategories
            .map<CategoryModel>((e) => CategoryModel.fromJson(e))
            .toList();
      }
      print("${categories.length} + 3333333333333");
      emit(GetCategorySuccessState());
    }, (r) => emit(GetCategoryErrorState()));
  }
}
