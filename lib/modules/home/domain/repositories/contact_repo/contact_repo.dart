import 'package:dartz/dartz.dart';
import 'package:pos_flutter/core/api/failure.dart';
import 'package:pos_flutter/modules/home/data/datasource/home_remote_datasource.dart';
import 'package:pos_flutter/modules/home/data/models/contact_model/contact_model.dart';
import 'package:pos_flutter/modules/home/data/models/product_model/product_model.dart';

class ContactRepo {
  final HomeRemoteDatasource _homeRemoteDatasource = HomeRemoteDatasource();

  Future<Either<List<ContactModel>, Failure>> getContacts(
      {required int page}) async {
    try {
      final response = await _homeRemoteDatasource.getContacts(page: page);
      Either<List<ContactModel>, Failure> result = response.fold((l) {
        final allContacts = l.data["data"];
        List<ContactModel> contacts = [];
        if (allContacts != null) {
          contacts = allContacts
              .map<ContactModel>((e) => ContactModel.fromJson(e))
              .toList();
        }
        print("${contacts.length} + 22222222222");
        return Left(contacts);
      }, (failure) => Right(failure));
      return result;
    } on Failure catch (failure) {
      return Right(failure);
    }
  }

  Future<Either<ContactModel, Failure>> addContact(
      {required String name,
      required String mobile,
      String? companyName,
      required String carNumber,
      required String carModel}) async {
    try {
      final response = await _homeRemoteDatasource.addContact(
          name: name,
          mobile: mobile,
          companyName: companyName,
          carNumber: carNumber,
          carModel: carModel);
      Either<ContactModel, Failure> result = response.fold((l) {
        final data = l.data["data"];
        ContactModel contact=ContactModel();
        if (data != null) {
          contact = ContactModel.fromJson(data);
        }
        print(" + 22222222222");
        return Left(contact);
      }, (failure) => Right(failure));
      return result;
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
}
