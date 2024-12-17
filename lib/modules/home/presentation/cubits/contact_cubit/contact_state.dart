import 'package:pos_flutter/modules/home/data/models/contact_model/contact_model.dart';

abstract class ContactState {}

class InitState extends ContactState {}

class GetContactLoadingState extends ContactState {}

class GetContactSuccessState extends ContactState {
  final List<ContactModel> contacts;

  GetContactSuccessState(this.contacts);
}

class GetContactErrorState extends ContactState {
  final String message;

  GetContactErrorState(this.message);
}

class AddContactLoadingState extends ContactState {}

class AddContactSuccessState extends ContactState {
  final ContactModel contact;

  AddContactSuccessState(this.contact);
}

class AddContactErrorState extends ContactState {
  final String message;

  AddContactErrorState(this.message);
}
