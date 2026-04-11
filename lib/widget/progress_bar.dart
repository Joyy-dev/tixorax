import 'package:flutter/material.dart';
import 'package:tixora/widget/step_column.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              height: 2,
              color: const Color(0xFF2A1C49),
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StepColumn('EVENT INFO', Icons.calendar_today, isActive: true),
              StepColumn('TICKETS', Icons.confirmation_num_outlined, isActive: false),
              StepColumn('REVIEW', Icons.visibility_outlined, isActive: false),
            ],
          ),
        ],
      ),
    );
  }
}