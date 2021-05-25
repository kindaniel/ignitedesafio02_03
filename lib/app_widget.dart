import 'package:flutter/material.dart';
import 'package:rocketdesafio02/pages/create_note_page.dart';
import 'package:rocketdesafio02/pages/list_note_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData(primarySwatch: Colors.indigo),
      routes: {
        "/": (context) => ListNotePage(),
        "/create-note": (context) => CreateNotePage()
      },
    );
  }
}
