import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_water_intake/bars/bar_data.dart';

class BarGraph extends StatelessWidget {
  final double maxY;
  final double sunWaterAmount;
  final double monWaterAmount;
  final double tueWaterAmount;
  final double wedWaterAmount;
  final double thuWaterAmount;
  final double friWaterAmount;
  final double satWaterAmount;

  const BarGraph({
    super.key,
    required this.maxY,
    required this.sunWaterAmount,
    required this.monWaterAmount,
    required this.tueWaterAmount,
    required this.wedWaterAmount,
    required this.thuWaterAmount,
    required this.friWaterAmount,
    required this.satWaterAmount,
  });

  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
      sunWaterAmount: sunWaterAmount,
      monWaterAmount: monWaterAmount,
      tueWaterAmount: tueWaterAmount,
      wedWaterAmount: wedWaterAmount,
      thuWaterAmount: thuWaterAmount,
      friWaterAmount: friWaterAmount,
      satWaterAmount: satWaterAmount,
    );
    return BarChart(BarChartData(
      maxY: maxY,
      minY: 0,
      barGroups: barData.bardata.map((data){
        return BarChartGroupData(x: data.x, 
        barRods: [
          BarChartRodData(
            toY: data.y
          )
        ]);
      }).toList()
    ));
  }
}
