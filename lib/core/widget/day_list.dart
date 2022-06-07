import 'package:flutter/material.dart';
import 'package:tasker/core/utils/date_time_utils.dart';
import 'package:tasker/main.dart';

class DayList extends StatelessWidget
{
  final DateTime date;
  final Function(int day) callback;

  const DayList({Key? key, required this.date, required this.callback}) : super(key: key);

  static double width = 50;
  static double height = 75;
  static int selected = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: height,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: DateTime(date.year, date.month + 1, 0).day,
        itemBuilder: (context, index) => _day(index, context)
      ),
    );
  }

  Widget _day(int index, BuildContext context)
  {
    return InkWell(
      onTap: () => callback(index + 1),
      child: Container(
          margin: const EdgeInsets.only(right: 5, left: 5),
          decoration: BoxDecoration(
              color: (index+1 == date.day) ?
              Theme.of(context).colorScheme.primary :
              Colors.grey.shade200.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)
          ),
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                DateTimeConverter.getDayName(date.withDay(index + 1).weekday),
                style: TextStyle(color: (index+1 == date.day) ? Colors.white: Colors.black),
              ),
              Text(
                  (index + 1).toString(),
                style: TextStyle(color: (index+1 == date.day) ? Colors.white: Colors.black),
              ),
            ],
          )
      ),
    );
  }
}
