import 'package:mvmm_auth_demo/data/responses/responses.dart';
import 'package:mvmm_auth_demo/domain/model/model.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain(ContactsResponse? contactsResponse) {
    Contacts contacts = contactsResponse.toDomain();
    return Customer(
      this?.id ?? '',
      this?.name ?? '',
      this?.balance ?? 0.0,
      contacts,
    );
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      this?.email ?? '',
      this?.phone ?? '',
      this?.link ?? '',
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse {
  Authentication toDomain() {
    return Authentication(customer.toDomain(contacts));
  }
}
