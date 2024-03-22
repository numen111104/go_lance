import 'package:flutter/material.dart';
import 'package:go_lance/entitles/item.dart';
import 'package:go_lance/presentation/color_pallete.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final double width;
  final void Function()? onTap;
  const ItemCard(
      {super.key, required this.item, required this.width, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
          ]),
      child: Row(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
                width: 120,
                height: 120,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(item.imageUrl), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: (item.driver.target != null)
                    ? Container(
                        color: Colors.white70,
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(9),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: goLanceYellow,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Picked Up arranged",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    : SizedBox()),
          ),
          SizedBox(
            width: width - 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  item.customer.target!.name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  item.location,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
