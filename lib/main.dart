import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_lance/presentation/pages/login_page.dart';
import 'package:go_lance/presentation/pages/welcome_page.dart';
import 'package:go_lance/repositories/object_box.dart';

import 'objectbox.g.dart';

late Store store;
SyncClient? Sclient;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  store = (await ObjectBox.create()).store;

  if(Sync.isAvailable()){
    Sclient = Sync.client(store, Platform.isAndroid ? "ws://10.0.2.2:9999" : "ws://127.0.0.1:9999", SyncCredentials.none());

    Sclient?.start();
  }

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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

  @override
  void dispose() {
    super.dispose();
    store.close();
    Sclient?.stop();
    Sclient?.close();
  }
}
