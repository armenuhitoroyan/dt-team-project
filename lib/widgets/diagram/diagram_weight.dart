import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DiagramWeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 6,
            minY: 0,
            maxY: 1000,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 50),
                  const FlSpot(1, 70),
                  const FlSpot(2, 150),
                  const FlSpot(3, 190),
                  const FlSpot(4, 170),
                  const FlSpot(5, 500),
                  const FlSpot(6, 850),
                ],
                isCurved: true,
                color: Colors.purple,
                barWidth: 2,
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.purple.withOpacity(0.3),
                ),
                dotData: const FlDotData(show: true),
              ),
            ],
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    const style = TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    );
                    switch (value.toInt()) {
                      case 0:
                        return const Text('JAN', style: style);
                      case 1:
                        return const Text('FEB', style: style);
                      case 2:
                        return const Text('MAR', style: style);
                      case 3:
                        return const Text('APR', style: style);
                      case 4:
                        return const Text('MAY', style: style);
                      case 5:
                        return const Text('JUN', style: style);
                      case 6:
                        return const Text('JUL', style: style);
                    }
                    return Container();
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 200,
                  getTitlesWidget: (value, meta) {
                    return Text('${value.toInt()}');
                  },
                ),
              ),
            ),
            gridData: const FlGridData(show: true),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
