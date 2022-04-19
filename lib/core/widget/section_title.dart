import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget 
{
  const SectionTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Your close tasks',
            style: TextStyle(fontSize: 24),
          ),
          Icon(Icons.chevron_right, size: 24,)
        ],
      ),
    );
  }
}
