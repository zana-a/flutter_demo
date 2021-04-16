import 'dart:io';

class Date {
  final DateTime _date;

  Date(this._date);

  String get date {
    if (this.isBefore(seconds: 1)) {
      return "${this._date.second}s ago";
    } else {
      return "${this._date.day}/${this._date.month}/${this._date.year}";
    }
  }

  bool isBefore(
      {int seconds = 0, int minutes = 0, int hours = 0, int days = 0}) {
    return this._date.isBefore(
          DateTime.now().subtract(
            Duration(
              seconds: seconds,
              minutes: minutes,
              hours: hours,
              days: days,
            ),
          ),
        );
  }
}
