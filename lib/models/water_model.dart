class Water {

final String? id;
final double amount;
final String unit;
final DateTime dateTime;

  Water({this.id, required this.amount, required this.unit, required this.dateTime});


factory Water.fromJson(Map<String, dynamic> json, String id){
  return Water(id: id, amount: json["amount"], unit: json["unit"], dateTime: DateTime.now());
}

Map<String, dynamic> toJson(){
  return{
    "amount": amount,
    "dateTime": DateTime.now(),
    "unit": unit
  };
}

 

}
