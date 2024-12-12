import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/config/routes/router_keys.dart';
import 'package:pos_flutter/modules/main/presentation/cubits/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitState());

  static AppCubit get(context, {bool listen = false}) =>
      BlocProvider.of<AppCubit>(context, listen: listen);
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  changeCurrentIndex(int index) {
    _currentIndex = index;
    
    emit(ChangeCurrentIndexState());
  }
}
