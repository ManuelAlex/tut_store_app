//To convert nullable Responses Object to non nullable Object
import 'package:tut_store_app/app_core/extension.dart';
import 'package:tut_store_app/business/data/responses/authentication_responses.dart';
import 'package:tut_store_app/business/data/responses/contacts_responce.dart';
import 'package:tut_store_app/business/data/responses/customer_response.dart';
import 'package:tut_store_app/business/domain/models/authentication_model.dart';
import 'package:tut_store_app/business/domain/models/contact_model.dart';
import 'package:tut_store_app/business/domain/models/customer_model.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() => Customer(
        //we re force onwrapping because OrEmpty() or orZero cant return null so we can assume the fields cant be empty
        id: this!.id.orEmpty(),
        message: this!.message.orEmpty(),
        noOfNotification: this!.noOfNotification.orZero(),
      );
}

extension ContactResponseMapper on ContactsResponse? {
  Contacts toDomain() => Contacts(
        email: this!.email.orEmpty(),
        phone: this!.phone.orEmpty(),
        link: this!.link.orEmpty(),
      );
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() => Authentication(
        contacts: this!.contacts.toDomain(),
        customer: this!.customer.toDomain(),
      );
}
