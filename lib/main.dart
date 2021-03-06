import 'package:flutter/material.dart';

import 'src/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RSS',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          centerTitle: true,
          title: const Text('Lenta'),
        ),
        body: const MainPage(),
      ),
    );
  }
}
