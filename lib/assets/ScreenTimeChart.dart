import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ScreenTimeChart extends StatelessWidget {
  const ScreenTimeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 219,
      child: BarChart(
        BarChartData(
          maxY: 6,
          barGroups: [
            makeBar(0, 2.5),
            makeBar(1, 3.0),
            makeBar(2, 4.2),
            makeBar(3, 4.8),
            makeBar(4, 4.5),
            makeBar(5, 3.5),
            makeBar(6, 6.2),
          ],
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const times = [
                    'MON',
                    'TUES',
                    'WED',
                    'THURS',
                    'FRI',
                    'SAT',
                    'SUN',
                  ];
                  return Text(
                    times[value.toInt()],
                    style: const TextStyle(fontSize: 10),
                  );
                },
                reservedSize: 30,
              ),
            ),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barTouchData: BarTouchData(enabled: false),
        ),
      ),
    );
  }

  BarChartGroupData makeBar(int x, double y) {
    Color barColor;
    if (x % 2 == 0) {
      barColor = Colors.black; // Even index
    } else {
      barColor = const Color.fromARGB(255, 195, 152, 115); // Odd index
    }

    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 20,
          borderRadius: BorderRadius.circular(4),

          color: barColor,
        ),
      ],
    );
  }
}
