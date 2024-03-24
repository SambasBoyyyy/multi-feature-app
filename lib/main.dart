import 'package:flutter/material.dart';

import 'features/list/view/page/list.dart';

void main() {
  runApp(
      MaterialApp(
        home: MyApp(),
      ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ListScreen();
  }
}