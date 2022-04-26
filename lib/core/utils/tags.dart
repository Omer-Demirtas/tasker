import 'package:flutter/material.dart';
import 'package:tasker/core/model/tag.dart';

class Tags
{
  static final List<Tag> tags =
  <Tag>[
    Tag('School', Icons.school),
    Tag('Shopping', Icons.shopping_cart),
    Tag('Work', Icons.work),
    Tag('Photo', Icons.photo),
    Tag('Travel', Icons.travel_explore),
  ];
}