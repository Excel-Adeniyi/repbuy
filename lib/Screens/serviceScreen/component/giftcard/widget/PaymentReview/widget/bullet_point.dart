import 'package:flutter/material.dart';

class BulletPoint extends StatelessWidget {
  final List<String> str;
  const BulletPoint({Key? key, required this.str}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: str.map((strings) {
      return Row(
        children: [
          const Text(
            '\u2022',
            style: TextStyle(
              fontSize: 16,
              height: 1.55,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              strings,
              textAlign: TextAlign.left,
              softWrap: true,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black.withOpacity(0.6),
                height: 1.55,
              ),
            ),
          ),
        ],
      );
    }).toList());
  }
}
