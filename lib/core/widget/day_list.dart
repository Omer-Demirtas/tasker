import 'package:flutter/material.dart';

class DayList extends StatelessWidget
{
  final int selectedDay;
  final Function(int day) callback;

  const DayList({Key? key, required this.selectedDay, required this.callback}) : super(key: key);

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
        itemCount: DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day,
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
              color: (index == selectedDay) ?
              Theme.of(context).colorScheme.primary :
              Colors.grey.shade200.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)
          ),
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'SuN',
                style: TextStyle(color: (index == selectedDay) ? Colors.white: Colors.black),
              ),
              Text(
                  (index + 1).toString(),
                style: TextStyle(color: (index == selectedDay) ? Colors.white: Colors.black),
              ),
            ],
          )
      ),
    );
  }
}
