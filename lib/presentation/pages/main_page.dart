import 'package:flutter/material.dart';
import 'package:go_lance/entitles/item.dart';
import 'package:go_lance/entitles/user.dart';
import 'package:go_lance/main.dart';
import 'package:go_lance/objectbox.g.dart';
import 'package:go_lance/presentation/assets.dart';
import 'package:go_lance/presentation/color_pallete.dart';
import 'package:go_lance/presentation/pages/add_item_page.dart';
import 'package:go_lance/presentation/pages/item_detail_page.dart';
import 'package:go_lance/presentation/widgets/item_card.dart';
import 'package:go_lance/presentation/widgets/nav_bar_icon.dart';
import 'package:go_lance/presentation/widgets/text_chip.dart';
import 'package:go_lance/presentation/widgets/text_tab_button.dart';
import 'package:go_lance/repositories/item_repository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:objectbox/objectbox.dart';

class MainPage extends StatefulWidget {
  final User user;
  const MainPage({super.key, required this.user});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isUrgentCategory = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 124),
        child: buildAppBar(),
      ),
      body: SafeArea(
        child: Stack(children: [
          buildBody(),
          buildBottomNavBar(context),
        ]),
      ),
    );
  }

  AppBar buildAppBar() => AppBar(
        elevation: 4,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildFoodNonFoodSection(),
                    buildUserSection(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                buildOtherCategoriesSection()
              ],
            ),
          ),
        ),
      );

  Widget buildFoodNonFoodSection() => Row(children: [
        TextTabButton(
            text: "Urgent",
            isChoiced: isUrgentCategory,
            onTap: () {
              if (!isUrgentCategory) {
                setState(() {
                  isUrgentCategory = true;
                });
              }
            }),
        const SizedBox(
          width: 10,
        ),
        TextTabButton(
          text: "Non Urgent",
          isChoiced: !isUrgentCategory,
          onTap: () {
            if (isUrgentCategory) {
              setState(() {
                isUrgentCategory = false;
              });
            }
          },
        ),
      ]);

  Widget buildUserSection() => Row(children: [
        Text(
          "Welcome ${widget.user.name.split(' ').first}",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
      ]);

  Widget buildOtherCategoriesSection() => const Row(children: [
        TextChip(
          text: "Injury",
          textColor: Colors.white,
          backgroundColor: goLanceGreen,
        ),
        TextChip(
          text: "Death",
        ),
        TextChip(
          text: "Accident",
        ),
        TextChip(
          text: "Other",
        ),
      ]);

  Widget buildBody() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        child: StreamBuilder<Query<Item>>(
          stream: ItemRepository(store: store).getQueryStream(
            Item_.isUrgent.equals(isUrgentCategory) &
                Item_.isPickedUp.equals(false),
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ListView(
                  children: [
                    Column(
                      children: snapshot.data!
                          .find()
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: ItemCard(
                                key: ValueKey(e.id),
                                tag: e.id.toString(),
                                item: e,
                                width: MediaQuery.of(context).size.width - 70,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetailsPage(
                                            item: e,
                                            user: widget.user,
                                            tag: e.id.toString())),
                                  );
                                },
                              ),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      );

  Widget buildBottomNavBar(BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 70,
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const NavBarIcon(
                  text: "Home", iconAssetPath: Assets.selectedHome),
              const NavBarIcon(text: "Goals", iconAssetPath: Assets.goals),
              SizedBox(
                width: 70,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddItemPage(user: widget.user),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(goLanceMagenta),
                    shape: MaterialStateProperty.all(CircleBorder()),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
              const NavBarIcon(text: "Forum", iconAssetPath: Assets.forum),
              const NavBarIcon(text: "Message", iconAssetPath: Assets.message),
            ],
          ),
        ),
      );
}
