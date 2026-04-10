import 'package:flutter/material.dart';

class FakeRow extends StatelessWidget {
  const FakeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(width: 40, height: 3, color: Colors.white12),
        Container(width: 30, height: 3, color: Colors.white12),
        Container(width: 20, height: 3, color: Colors.white12),
      ],
    );
  }
}