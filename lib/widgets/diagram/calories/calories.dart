import 'package:chat_messanger_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CaloriesChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Calories',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const Text(
          'Remaining = Goal-Food+Exercise',
          style: TextStyle(color: AppColors.grey),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildChart('', 250, 543, Colors.green),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChart(String label, double consumed, double total, Color color) {
    double percent = consumed / total;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 90,
              height: 90,
              child: CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 10.0,
                percent: percent,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${consumed.toInt()}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Remaining',
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ],
                ),
                progressColor: color,
                backgroundColor: Colors.grey[200]!,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset(
                        'assets/images/goal.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text('Base Goal'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset(
                        'assets/images/carrot.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text('Food'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset(
                        'assets/images/fire.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text('Exercise'),
                  ],
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
