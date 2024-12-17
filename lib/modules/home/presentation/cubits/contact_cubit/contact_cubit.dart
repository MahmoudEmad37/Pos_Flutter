import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/modules/home/domain/repositories/contact_repo/contact_repo.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/contact_cubit/contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  final ContactRepo _contactRepo;

  ContactCubit(this._contactRepo) : super(InitState());

  static ContactCubit get(context, {bool listen = false}) =>
      BlocProvider.of<ContactCubit>(context, listen: listen);

  getAllContacts({int page = -1}) async {
    emit(GetContactLoadingState());
    final result = await _contactRepo.getContacts(page: page,);
    result.fold((data) {
      emit(GetContactSuccessState(data));
    }, (failure) => emit(GetContactErrorState(failure.toString())));
  }

  addContact({required String name,
      required String mobile,
      String? companyName,
      required String carNumber,
      required String carModel }) async {
    emit(AddContactLoadingState());
    final result = await _contactRepo.addContact(name: name,
          mobile: mobile,
          companyName: companyName,
          carNumber: carNumber,
          carModel: carModel,);
    result.fold((data) {
      emit(AddContactSuccessState(data));
      getAllContacts();
    }, (failure) => emit(AddContactErrorState(failure.toString())));
  }
}
