import 'package:flutter/material.dart';
import 'package:flutter_water_intake/bars/bar_graph.dart';
import 'package:flutter_water_intake/provider/water_model_provider.dart';
import 'package:flutter_water_intake/utils/date_helper.dart';
import 'package:provider/provider.dart';

class WaterSummary extends StatelessWidget {
  final DateTime startofWeek;

  const WaterSummary({super.key, required this.startofWeek});

  double calculateMaxAmount(
    WaterModel waterModel,
    String sunday, 
    String monday, 
    String tuesday, 
    String wednesday, 
    String thursday, 
    String friday, 
    String saturday, 
  ){

  double maxAmount = 100;

  List<double> valuesData = [
    waterModel.calculateDailyWaterSummary()[sunday] ?? 0,
    waterModel.calculateDailyWaterSummary()[monday] ?? 0,
    waterModel.calculateDailyWaterSummary()[tuesday] ?? 0,
    waterModel.calculateDailyWaterSummary()[wednesday] ?? 0,
    waterModel.calculateDailyWaterSummary()[thursday] ?? 0,
    waterModel.calculateDailyWaterSummary()[friday] ?? 0,
    waterModel.calculateDailyWaterSummary()[saturday] ?? 0,
  ];

  valuesData.sort();

  maxAmount = valuesData.last;

  return maxAmount == 0 ? 100 : maxAmount;

  }

  @override
  Widget build(BuildContext context) {
    String sunday = getReadAbleDate(startofWeek.add(Duration(days: 0)));
    String monday = getReadAbleDate(startofWeek.add(Duration(days: 1)));
    String tuesday = getReadAbleDate(startofWeek.add(Duration(days: 2)));
    String wednesday = getReadAbleDate(startofWeek.add(Duration(days: 3)));
    String thursday = getReadAbleDate(startofWeek.add(Duration(days: 4)));
    String friday = getReadAbleDate(startofWeek.add(Duration(days: 5)));
    String saturday = getReadAbleDate(startofWeek.add(Duration(days: 6)));

    return Consumer(
      builder: (context, WaterModel value, child) {
        return Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: SizedBox(
            height: 200,
            child: BarGraph(
              maxY: calculateMaxAmount(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday),
              sunWaterAmount: value.calculateDailyWaterSummary()[sunday] ?? 0,
              monWaterAmount: value.calculateDailyWaterSummary()[monday] ?? 0,
              tueWaterAmount: value.calculateDailyWaterSummary()[tuesday] ?? 0,
              wedWaterAmount: value.calculateDailyWaterSummary()[wednesday] ?? 0,
              thuWaterAmount: value.calculateDailyWaterSummary()[thursday] ?? 0,
              friWaterAmount: value.calculateDailyWaterSummary()[friday] ?? 0,
              satWaterAmount: value.calculateDailyWaterSummary()[saturday] ?? 0,
            ),
          ),
        );
      },
    );
  }
}
