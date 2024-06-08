import 'package:flutter/material.dart';
import 'package:trogon_mechine_task/model/day_model.dart';

class DayWidget extends StatelessWidget {
  final DayInfo dayInfo;

  DayWidget({required this.dayInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: dayInfo.isActive ? Colors.purple : Colors.purple[50],
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.purple,
                width: 2.0,
              ),
              boxShadow: dayInfo.isActive
                  ? [BoxShadow(color: Colors.purple.withOpacity(0.5), blurRadius: 10, spreadRadius: 2)]
                  : [],
            ),
            child: Column(
              children: [
                Text(
                  'DAY',
                  style: TextStyle(
                    color: dayInfo.isActive ? Colors.white : Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '${dayInfo.dayNumber}',
                  style: TextStyle(
                    color: dayInfo.isActive ? Colors.white : Colors.purple,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                dayInfo.isLocked
                    ? const Icon(Icons.lock_outline, color: Colors.purple)
                    : Text(
                        dayInfo.date,
                        style: TextStyle(
                          color: dayInfo.isActive ? Colors.white : Colors.purple,
                        ),
                      ),
              ],
            ),
          ),
          if (dayInfo.isActive)
            Container(
              margin: EdgeInsets.only(top: 8.0),
              width: 8.0,
              height: 8.0,
              decoration: const BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}