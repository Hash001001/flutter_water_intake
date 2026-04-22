import 'package:flutter_water_intake/bars/individual_bar_data.dart';

class BarData {
  final double sunWaterAmount;
  final double monWaterAmount;
  final double tueWaterAmount;
  final double wedWaterAmount;
  final double thuWaterAmount;
  final double friWaterAmount;
  final double satWaterAmount;

  BarData({
    required this.sunWaterAmount,
    required this.monWaterAmount,
    required this.tueWaterAmount,
    required this.wedWaterAmount,
    required this.thuWaterAmount,
    required this.friWaterAmount,
    required this.satWaterAmount,
  });

  List<IndividualBar> bardata = [];

  //initialze bar data
  void initBarData(){
    bardata = [
      IndividualBar(x: 0, y: sunWaterAmount),
      IndividualBar(x: 0, y: monWaterAmount),
      IndividualBar(x: 0, y: tueWaterAmount),
      IndividualBar(x: 0, y: wedWaterAmount),
      IndividualBar(x: 0, y: thuWaterAmount),
      IndividualBar(x: 0, y: friWaterAmount),
      IndividualBar(x: 0, y: satWaterAmount),
    ];
  }

}
