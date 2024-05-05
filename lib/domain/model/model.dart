class Customer {
  String id;
  String name;
  double balance;
  Contacts contacts;

  Customer(this.id, this.name, this.balance, this.contacts);
}

class Contacts {
  String email;
  String phone;
  String link;

  Contacts(this.email, this.phone, this.link);
}

class Authentication {
  Customer customer;

  Authentication(this.customer);
}

class DeviceInfo {
  String name;
  String identifier;
  String version;

  DeviceInfo(this.name, this.identifier, this.version);
}
