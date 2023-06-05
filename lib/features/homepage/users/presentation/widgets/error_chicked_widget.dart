import 'package:flutter/material.dart';

class ErrorChickeWidget extends StatelessWidget {
  const ErrorChickeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Something was wrong',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
