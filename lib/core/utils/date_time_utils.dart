
import 'package:flutter/material.dart';

class DateTimeConverter {

  static String convertDateTimeToString(DateTime date)
  {
    return '${date.day}/${date.month}/${date.year}';
  }

  static String convertTimeToString(TimeOfDay time)
  {
    return '${time.hour}:${time.minute}';
  }

  static int convertTimeToInt(TimeOfDay time)
  {
    return int.parse('${time.hour}${time.minute}');
  }

  static TimeOfDay convertIntToTime(int i)
  {
    String timeStr = i.toString();
    return TimeOfDay(hour: int.parse(timeStr.substring(0, 2)), minute: int.parse(timeStr.substring(2)));
  }
}