import 'dart:ui';
import 'package:flutter/material.dart';


String getReadAbleDate(DateTime dateTime){

//2028/02/24

String year= dateTime.year.toString();
String month = dateTime.month.toString();
String day=  dateTime.day.toString();

if(month.length==1){
  month = '0${dateTime.month}';
}
if(day.length ==1){
  day = '0${dateTime.day}';
}

return year + month + day;

}