import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_water_intake/models/water_model.dart';
import 'package:http/http.dart' as http;

class WaterModel extends ChangeNotifier {
  List<Water> waterList = [];

  void savewater(Water water) async {
    final url = Uri.https(
      "water-intaker-1b921-default-rtdb.asia-southeast1.firebasedatabase.app",
      "water.json",
    );

    var response = await http.post(
      url,
      headers: {"Content-Type": "Application/Json"},
      body: json.encode({
        "amount": double.parse(water.amount.toString()),
        "unit": "ml",
        "dateTime": DateTime.now().toString(),
      }),
    );

    if (response.statusCode == 200) {
      final responseStr = json.decode(response.body) as Map<String, dynamic>;
      waterList.add(
        Water(
          id: responseStr["name"],
          amount: water.amount,
          unit: "ml",
          dateTime: water.dateTime,
        ),
      );
    } else {
      print("Error respone -> ${response.statusCode}");
    }

    notifyListeners();
  }

  Future<List<Water>> getWaterList() async {
    final url = Uri.https(
      "water-intaker-1b921-default-rtdb.asia-southeast1.firebasedatabase.app",
      "water.json",
    );

    final response = await http.get(url);

    if (response.statusCode == 200 && response.body != 'null') {
      waterList.clear();
      //we are good to  go
      var responseData = json.decode(response.body) as Map<String, dynamic>;

      for (var data in responseData.entries) {
        waterList.add(
          Water(
            id: data.key,
            amount: data.value["amount"],
            unit: data.value["unit"],
            dateTime: DateTime.parse(data.value["dateTime"]),
          ),
        );
      }
    }
    notifyListeners();
    return waterList;
  }

  void delete(Water item) {
    final url = Uri.https(
      "water-intaker-1b921-default-rtdb.asia-southeast1.firebasedatabase.app",
      "water/${item.id}.json",
    );

    http.delete(url);
    waterList.removeWhere((e) => e.id == item.id);
    notifyListeners();
  }

  String weekday(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return "Mon";

      case 2:
        return "Tue";

      case 3:
        return "Wed";

      case 4:
        return "Thu";
      case 5:
        return "Fri";

      case 6:
        return "Sat";

      case 7:
        return "Sun";
      default:
        return "";
    }
  }

  DateTime getStartOfTheWeekDay() {
    DateTime? startOfTheWeek;

    DateTime currentDateTime = DateTime.now();

    for (int i = 0; i < 7; i++) {
      if(weekday(currentDateTime.subtract(Duration(days: i))) == "Sun"){
          startOfTheWeek = currentDateTime.subtract(Duration(days: i));
      }
    }
    return startOfTheWeek!;
  }
}
