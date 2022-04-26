import 'package:flutter/material.dart';

class DaYList extends StatelessWidget
{
  const DaYList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 40,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 40,
        itemBuilder: (context, index) => Container(
          color: Colors.pink,
          height: 40,
          width: 40,
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Text('${index + 1}'),
              Text('${index + 1}'),
            ],
          ),
        )
      ),
    );
  }
}
