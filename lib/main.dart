import 'package:flutter/material.dart';
import 'databox_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Databox> databoxes = [
    Databox(label: "Username", value: "JDoe"),
    Databox(label: "Name", value: "John Doe"),
    Databox(label: "City", value: "London"),
    Databox(label: "Country", value: "UK"),
    Databox(label: "Birthdate", value: "07-15-1999"),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Databox Widget"),
      ),
      body: Column(
        children: [
          DataboxWidget(
            data: databoxes,
          ),
          DataboxWidget.row(
            data: databoxes,
          ),
        ],
      ),
    );
  }
}
