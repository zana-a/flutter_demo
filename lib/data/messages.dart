import 'package:faker/faker.dart';
import 'package:flutter_app/util/Date.dart';

final messages = [
  {
    'user': '@user1',
    'message': Faker().lorem.word(),
    'date': Date(DateTime.now()),
    'isRead': false,
    'isInBound': true,
  },
  {
    'user': '@user2',
    'message': Faker().lorem.sentence(),
    'date': Date(DateTime.now()),
    'isRead': false,
    'isInBound': false,
  },
  {
    'user': '@user1',
    'message': Faker().lorem.word(),
    'date': Date(DateTime.now()),
    'isRead': false,
    'isInBound': false,
  },
  {
    'user': '@user1',
    'message': Faker().lorem.sentence().substring(6),
    'date': Date(DateTime.now()),
    'isRead': false,
    'isInBound': false,
  },
  {
    'date': Date(DateTime.now()),
    'isDateToken': true,
  }
];

void main() {
  print(messages);
}
