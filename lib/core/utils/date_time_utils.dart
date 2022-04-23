
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
}