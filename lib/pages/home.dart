import 'package:flutter/material.dart';
import 'package:flutter_water_intake/models/water_model.dart';
import 'package:flutter_water_intake/provider/water_model_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final amountController = TextEditingController();

  @override
  void initState() {
    Provider.of<WaterModel>(context, listen: false).getWaterList();
    super.initState();
  }

  void saveWater() {
    Provider.of<WaterModel>(context, listen: false).savewater(
      Water(
        amount: double.parse(amountController.text.toString()),
        unit: "ml",
        dateTime: DateTime.now(),
      ),
    );

    if (!context.mounted) {
      return;
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
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                saveWater();
                amountController.clear();
                Navigator.of(context).pop();
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
    var provider = Provider.of<WaterModel>(context, listen: false);
    return Consumer(
      builder: (BuildContext context, WaterModel value, Widget? child) =>
          Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 4,
              title: Text("Water"),
              actions: [Icon(Icons.map)],
            ),
            body: ListView.builder(
              itemCount: value.waterList.length,
              itemBuilder: (context, index) {
                final item = value.waterList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.water_drop, color: Colors.lightBlueAccent),
                          Text(
                            item.amount.toStringAsFixed(2),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      subtitle: Text(
                        "${item.dateTime.day}/${item.dateTime.month}",
                      ),
                      trailing: IconButton(onPressed: (){
                        Provider.of<WaterModel>(context, listen: false).delete(item);
                      }, icon: Icon(Icons.delete)),
                    ),
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: waterDialog,
              backgroundColor: Colors.amberAccent,
              child: Icon(Icons.add),
            ),
          ),
    );
  }
}
