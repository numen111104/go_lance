import 'package:flutter/material.dart';
import 'package:go_lance/entitles/item.dart';
import 'package:go_lance/entitles/user.dart';
import 'package:go_lance/main.dart';
import 'package:go_lance/presentation/color_pallete.dart';
import 'package:go_lance/presentation/widgets/custom_elevated_button.dart';
import 'package:go_lance/repositories/item_repository.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDetailsPage extends StatelessWidget {
  final Item item;
  final User user;
  final String tag;
  const ItemDetailsPage(
      {super.key, required this.item, required this.user, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: goLanceGreen,
        title: Text(item.name),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Hero(
                    tag: tag,
                    child: Image.asset(item.imageUrl, fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: goLanceGreen,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 90,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${item.customer.target?.name} is looking for ambulance 🔎🚑",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                item.name,
                                style: GoogleFonts.montserrat(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        item.description,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ),
                    Text(
                      "Pick-Up Times",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      item.pickupTime,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Pick-Up Location",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      item.location,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (item.driver.target == null &&
                        item.customer.target?.id != user.id)
                      CustomButton(
                        text: "Request to Pick-Up",
                        onPressed: () {
                          ItemRepository(store: store)
                              .requestItem(item: item, user: user);
                          Navigator.pop(context);
                        },
                        color: goLanceMagenta,
                      ),
                    if (item.driver.target != null)
                      Column(children: [
                        Center(
                          child: Text(
                            "${item.driver.target?.id == user.id ? "You" : item.driver.target?.name} requested this client",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        if (item.customer.target?.id == user.id)
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomButton(
                                color: goLanceYellow,
                                text: "Confirm Pick-Up",
                                onPressed: () {
                                  ItemRepository(store: store)
                                      .pickUpItem(item: item);
                                  Navigator.pop(context);
                                }),
                          ),
                      ])
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
