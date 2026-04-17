import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final amountController = TextEditingController();

  void savewater(String amount) async {
    final url = Uri.https(
      "water-intaker-1b921-default-rtdb.asia-southeast1.firebasedatabase.app",
      "water.json",
    );

    var response = await http.post(
      url,
      headers: {"Content-Type": "Application/Json"},
      body: json.encode({
        "amount": double.parse(amount),
        "unit" : "ml",
        "dateTime": DateTime.now().toString()
      }),
    );

    if(response.statusCode == 200){
      print("api success");

    }else{
      print("error calling api");
    }

  }

  void waterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Water"),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Add water to your daily life"),
              SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.number,
                controller: amountController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Amount"),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                savewater(amountController.text.trim().toString());
              },
              child: Text(
                "Save",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 4,
        title: Text("Water"),
        actions: [Icon(Icons.map)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: waterDialog,
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}
