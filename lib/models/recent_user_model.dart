import 'dart:math';

import 'package:faker_dart/faker_dart.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Lead {
  final String? icon,
      name,
      date,
      budget,
      company,
      email,
      status,
      leadID,
      phone,
      industry,
      description,
      source,
      assigned_to_id;

  Lead({
    this.icon,
    this.name,
    this.date,
    this.budget,
    this.company,
    this.email,
    this.status,
    this.leadID,
    this.phone,
    this.industry,
    this.description,
    this.source,
    this.assigned_to_id,
  });
}

List<Lead> recentLead = [
  for (int i = 0; i < 5; i++)
      Lead(
        icon: "assets/icons/xd_file.svg",
        name: "${Faker.instance.name.fullName()}",
        date: DateFormat("dd MMM,yyyy").format(
          DateTime.now().subtract(
            Duration(
              days: Random.secure().nextInt(7),
            ),
          ),
        ),
        budget: Random.secure().nextInt(100000000).toString(),
        company: Faker.instance.company.companyName(),
        email: "${Faker.instance.name.firstName().toString()}@gmail.com",
        status: i % 2 == 0 ? "Contacted" : "Won",
        phone: Faker.instance.phoneNumber.phoneNumber(),
        industry: "Technology",
        description: Faker.instance.lorem.sentence(wordCount: 5),
        source: "Phone Call",
        assigned_to_id: Uuid().v1(),
        leadID: Uuid().v4(),
      ),
];

List<Lead> suggestedLead = [
  for (int i = 0; i < 5; i++)
    Lead(
      icon: "assets/icons/xd_file.svg",
      name: "${Faker.instance.name.fullName()}",
      date: DateFormat("dd MMM,yyyy").format(
        DateTime.now().subtract(
          Duration(
            days: Random.secure().nextInt(7),
          ),
        ),
      ),
      budget: Random.secure().nextInt(100000000).toString(),
      company: Faker.instance.company.companyName(),
      email: "${Faker.instance.name.firstName().toString()}@gmail.com",
      status: i % 2 == 0 ? "Contacted" : "Won",
      phone: Faker.instance.phoneNumber.phoneNumber(),
      industry: "Technology",
      description: Faker.instance.lorem.sentence(wordCount: 5),
      source: "Phone Call",
      assigned_to_id: Uuid().v1(),
      leadID: Uuid().v4(),
    ),
];


// List recentLead = [
//   Lead(
//     icon: "assets/icons/xd_file.svg",
//     name: "BoldTech",
//     point_of_contact: "Deniz Çolak",
//     email: "de***ak@huawei.com",
//     date: "01-03-2021",
//     posts: "4",
//   ),
//   Lead(
//     icon: "assets/icons/Figma_file.svg",
//     name: "Techsavvy Eduventures",
//     point_of_contact: "S*** Ç****",
//     email: "se****k1@google.com",
//     date: "27-02-2021",
//     posts: "19",
//   ),
//   Lead(
//     icon: "assets/icons/doc_file.svg",
//     name: "Iconic White",
//     point_of_contact: "N***** D****",
//     email: "ne****tr@google.com",
//     date: "23-02-2021",
//     posts: "32",
//   ),
//   Lead(
//     icon: "assets/icons/sound_file.svg",
//     name: "Udbhaban.AI",
//     point_of_contact: "Partha Pratim Bezboruah",
//     email: "bu****lk@google.com",
//     date: "21-02-2021",
//     posts: "3",
//   ),
//   Lead(
//     icon: "assets/icons/media_file.svg",
//     name: "",
//     point_of_contact: "A**** S**** K****",
//     email: "ah****az@google.com",
//     date: "23-02-2021",
//     posts: "2",
//   ),
//   Lead(
//     icon: "assets/icons/pdf_file.svg",
//     name: "T***** S****",
//     point_of_contact: "UI/UX Designer",
//     email: "te****cu@google.com",
//     date: "25-02-2021",
//     posts: "3",
//   ),
//   Lead(
//     icon: "assets/icons/excle_file.svg",
//     name: "K***** D****",
//     point_of_contact: "Business Analyst",
//     email: "ke****an@gmail.com",
//     date: "25-02-2021",
//     posts: "34",
//   ),
// ];
