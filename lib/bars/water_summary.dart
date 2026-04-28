import 'package:flutter/material.dart';
import 'package:flutter_water_intake/bars/bar_graph.dart';
import 'package:provider/provider.dart';

class WaterSummary extends StatelessWidget {
  final DateTime startofWeek;

  const WaterSummary({super.key, required this.startofWeek});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        return Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: SizedBox(
            height: 200,
            child: BarGraph(
              maxY: 100,
              sunWaterAmount: 19,
              monWaterAmount: 34,
              tueWaterAmount: 98,
              wedWaterAmount: 80,
              thuWaterAmount: 11,
              friWaterAmount: 40,
              satWaterAmount: 27,
            ),
          ),
        );
      },
    );
  }
}
