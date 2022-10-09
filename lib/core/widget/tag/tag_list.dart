import 'package:flutter/material.dart';
import 'package:tasker/core/model/tag.dart';
import 'package:tasker/core/utils/tags.dart';

class TagList extends StatelessWidget
{
  const TagList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 50,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 10,),
          for (Tag icon in Tags.tags) Container(
              margin: const EdgeInsets.only(right: 10),
              child: InputChip(
                //onSelected: (value) => voidCallback(),
                //avatar: Icon(icon.icon),
                label: Text(icon.title),
              )
          )
        ],
      ),
    );
  }
}
