import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  const ButtonWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () => {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18),
            ),
            const Icon(
              Icons.login,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
