import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WaterSummary extends StatelessWidget {
  const WaterSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, value, child) {
      return Column(
        children: [
          Text("data"),
        ],
      );
    }); 
  }
}