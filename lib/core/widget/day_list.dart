import 'package:flutter/material.dart';

class DaYList extends StatelessWidget
{
  const DaYList({Key? key}) : super(key: key);

  static double width = 50;
  static int selected = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(right: 5, left: 5),
          width: width,
          child: CircleAvatar(
            backgroundColor: selected == index ? Colors.green : Colors.grey,
            radius: width,
            child: Text((index + 1).toString(), style: TextStyle(color: Colors.black),),
          ),
        )
      ),
    );
  }
}
