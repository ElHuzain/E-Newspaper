import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

// To get data from API
Future<Map<String, dynamic>> fetch_from_API({required String URL,Map<String, String> params = const {}}) async{
  // Handling parameters
  params.forEach((key, value) => URL+="&${key}=${value}");
  print(URL);
  // Retrieving data
  http.Response data = await http.get(Uri.parse(URL));
  Map<String, dynamic> data_body = jsonDecode(data.body);
  return data_body;
}

// To convert date to correct string
String handle_date(String date){
  DateFormat days = DateFormat("d");
  DateFormat hours = DateFormat("h");
  DateTime D = DateTime.parse(date);
  if(int.parse(hours.format(D)) <= 24) return "${hours.format(D)}h";
  else return "${days.format(D)}d";
}

// To check if author is null
String validate_author(dynamic author){
  if(author == null) return "No Author";
  else return author;
}

