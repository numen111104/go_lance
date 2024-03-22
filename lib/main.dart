import 'package:flutter/material.dart';
import 'package:go_lance/presentation/pages/login_page.dart';
import 'package:go_lance/presentation/pages/welcome_page.dart';
import 'package:go_lance/repositories/object_box.dart';

import 'objectbox.g.dart';

late Store store;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  store = (await ObjectBox.create()).store;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Lance',
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/' :(context) => const WelcomePage(),
        '/login' :(context) => LoginPage(),
      },
      );
  }
}
