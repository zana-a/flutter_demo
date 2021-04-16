import 'package:faker/faker.dart';
import 'package:flutter_app/util/Date.dart';

final messages = [
  [
    {
      'user': '@user',
      'message': Faker().lorem,
      'date': Date(DateTime.now()),
      'isRead': false,
      'isInBound': true,
    },
    {
      'user': '@user',
      'message': Faker().lorem,
      'date': Date(DateTime.now()),
      'isRead': false,
      'isInBound': true,
    }
  ],
  [
    {
      'user': '@user',
      'message': Faker().lorem,
      'date': Date(DateTime.now()),
      'isRead': false,
      'isInBound': true,
    }
  ]
];

void main() {
  print(messages);
}
