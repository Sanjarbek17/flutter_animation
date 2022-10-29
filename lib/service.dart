import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future func()async{
  http.Response response=await http.get(Uri.parse('https://lidapa8228.pythonanywhere.com/api/get'));
  print(response.body.runtimeType);
  List jsonData=jsonDecode(response.body);
  return jsonData;
}

Future adding(String title)async{
  http.Response response=await http.post(Uri.parse('https://lidapa8228.pythonanywhere.com/api/add'),
  headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      {
        'name':title
      }
    )
  );
  
}

Future removing(String title)async{
  http.Response response=await http.post(Uri.parse('https://lidapa8228.pythonanywhere.com/api/del'),
  headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      {
        'name':title
      }
    )
  );
  
}

