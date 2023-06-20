import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  final String username;
  final String password;
  final  apiData;

  DisplayPage({required this.username, required this.password, required this.apiData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username: $username'),
            Text('Password: $password'),
            SizedBox(height: 16),
            Text('API Data: $apiData'),
          ],
        ),
      ),
    );
  }
}