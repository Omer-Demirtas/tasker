
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

  static String convertTimeToJustString(TimeOfDay time)
  {
    return '${time.hour.toString().length < 2 ? ('0' + time.hour.toString()) : time.hour.toString()}${time.minute.toString().length < 2 ? ('0' + time.minute.toString()) : time.minute.toString()}';
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

  static TimeOfDay convertStringToTime(String str)
  {
    return TimeOfDay(hour: int.parse(str.substring(0, 2)), minute: int.parse(str.substring(2)));
  }
}