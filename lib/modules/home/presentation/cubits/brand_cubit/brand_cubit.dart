import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/modules/home/data/models/brand_model/brand_model.dart';
import 'package:pos_flutter/modules/home/domain/repositories/brand_repo/brand_repo.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/brand_cubit/brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  final BrandRepo _brandRepo;

  BrandCubit(this._brandRepo) : super(InitState());

  static BrandCubit get(context, {bool listen = false}) =>
      BlocProvider.of<BrandCubit>(context, listen: listen);

  List<BrandModel> brands = [];

  getAllBrands() async {
    emit(GetBrandLoadingState());
    final result = await _brandRepo.getBrands();
    result.fold((data) {
      emit(GetBrandSuccessState(data));
    }, (failure) => emit(GetBrandErrorState(failure.toString())));
  }
}
