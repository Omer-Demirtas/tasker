

import 'package:flutter/material.dart';
import 'package:tasker/core/utils/style_constents.dart';

class BackAppBar extends StatelessWidget
{
  const BackAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const AppBarPadding.all(),
      child: Row(
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios)
          )
        ],
      ),
    );
  }
}
