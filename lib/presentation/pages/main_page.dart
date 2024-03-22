import 'package:flutter/material.dart';
import 'package:go_lance/entitles/item.dart';
import 'package:go_lance/entitles/user.dart';
import 'package:go_lance/presentation/assets.dart';
import 'package:go_lance/presentation/widgets/item_card.dart';

class MainPage extends StatefulWidget {
  final User user;
  const MainPage({super.key, required this.user});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Item item = Item(
      name: "Nama",
      description: "descrikipsi",
      pickupTime: "pickup",
      location: "locasi",
      imageUrl: Assets.placeholder,
    )
      ..customer.target = widget.user
      ..driver.target = User(name: "Misbahul", id: 12);
    return Scaffold(
      appBar: AppBar(
        title: const Text("title"),
      ),
      body: Center(
        child: ItemCard(item: item, width: 400),
      ),
    );
  }
}
