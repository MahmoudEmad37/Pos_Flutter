import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/modules/home/data/models/brand_model/brand_model.dart';
import 'package:pos_flutter/modules/home/domain/repositories/brand_repo/brand_repo.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/brand_cubit/brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  final BrandRepo _brandsRepo;

  BrandCubit(this._brandsRepo) : super(InitState());

  static BrandCubit get(context, {bool listen = false}) =>
      BlocProvider.of<BrandCubit>(context, listen: listen);
  List<BrandModel> brands = [];

  getAllBrands() async {
    emit(GetBrandLoadingState());
    final result = await _brandsRepo.getAllBrands();
    result.fold((l) {
      final allBrands = l.data["data"];
      if (allBrands != null) {
        brands =
            allBrands.map<BrandModel>((e) => BrandModel.fromJson(e)).toList();
      }
      print("${brands.length} + 2222222222222");
      emit(GetBrandSuccessState());
    }, (r) => emit(GetBrandErrorState()));
  }
}
