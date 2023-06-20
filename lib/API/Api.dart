import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../UI/DisplayPage.dart';


 Future fetchDataFromApi({required String username,required String password,required BuildContext context}) async {
    

    final dio = Dio();
    final url = 'http://101.53.135.201:8006/api/method/kvn_farmrich.api.v1.auth.authenticate';
    final data = {'username': username, 'password': password};

    final response = await dio.post(url, data: data);
    log('response : $response');
    if (response.statusCode == 200) {
      final apiData = response.data;
      // log('Response data: ${response.data}');
      log('apiData: ${apiData}');
       final message = apiData['message'];
    

       if (message is Map<String, dynamic> && message.containsKey('token')) {
    final token = message['token'];
    log('Token: $token');
  }

       
     
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DisplayPage(username: username, password: password, apiData: apiData),
        ) );
     
    } else {
     Fluttertoast.showToast(
        msg: "Error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }
  }