import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'connection_internet_state.dart';

class ConnectionInternetCubit extends Cubit<ConnectionInternetState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? streamSubscription;
  ConnectionInternetCubit() : super(ConnectionInternetInitial()) {
    streamSubscription = connectivity.onConnectivityChanged.listen((event) {
      if ([ConnectivityResult.mobile, ConnectivityResult.wifi]
          .contains(event[0])) {
        emit(ConnectionInternetOnState());
      } else {
        emit(ConnectionInternetOffState());
      }
    });
  }
  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
