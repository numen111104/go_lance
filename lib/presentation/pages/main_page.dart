import 'package:flutter/material.dart';
import 'package:go_lance/entitles/user.dart';

class MainPage extends StatefulWidget {
  final User user;
  const MainPage({super.key, required this.user});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("title"),
      ),
      body: Center(
        child: Text(widget.user.name),
      ),
    );
  }
}
