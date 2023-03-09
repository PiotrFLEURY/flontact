import 'package:flontacts/presentation/home/home.dart';
import 'package:flutter/material.dart';

class Flontact extends StatelessWidget {
  const Flontact({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Contacts Demo app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContactsPage(),
    );
  }
}
