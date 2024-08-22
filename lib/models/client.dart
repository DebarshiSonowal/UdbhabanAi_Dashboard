// import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'dart:math';

import 'package:faker_dart/faker_dart.dart';
import 'package:uuid/uuid.dart';

class Client {
  int? clientId, leadId;
  String? name, email, phone, company, industry;

  Client(this.clientId, this.leadId, this.name, this.email, this.phone,
      this.company, this.industry);
}

List<Client> clientList = [
  Client(
    Random().nextInt(10000),
    Random().nextInt(10000),
    Faker.instance.name.fullName(),
    "qwerty@gmail.com",
    "9678676752",
    Faker.instance.company.companyName(),
    "",
  ),
  Client(
    Random().nextInt(10000),
    Random().nextInt(10000),
    Faker.instance.name.fullName(),
    "qwerty@gmail.com",
    "9678676752",
    Faker.instance.company.companyName(),
    "",
  ),
  Client(
    Random().nextInt(10000),
    Random().nextInt(10000),
    Faker.instance.name.fullName(),
    "qwerty@gmail.com",
    "9678676752",
    Faker.instance.company.companyName(),
    "",
  ),
  Client(
    Random().nextInt(10000),
    Random().nextInt(10000),
    Faker.instance.name.fullName(),
    "qwerty@gmail.com",
    "9678676752",
    Faker.instance.company.companyName(),
    "",
  ),
];
