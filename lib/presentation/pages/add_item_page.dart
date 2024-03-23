// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_lance/entitles/item.dart';
import 'package:go_lance/entitles/user.dart';
import 'package:go_lance/main.dart';
import 'package:go_lance/presentation/assets.dart';
import 'package:go_lance/presentation/color_pallete.dart';
import 'package:go_lance/presentation/widgets/custom_elevated_button.dart';
import 'package:go_lance/presentation/widgets/custom_text_filed.dart';
import 'package:go_lance/repositories/item_repository.dart';
import 'package:google_fonts/google_fonts.dart';

class AddItemPage extends StatefulWidget {
  final User user;
  const AddItemPage({super.key, required this.user});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController pickUpController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  bool isUrgent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: goLanceGreen,
        title: const Text("Add Request"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildFoodNonFoodOption(),
                const SizedBox(
                  height: 20,
                ),
                ...buildTextField()
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> buildTextField() => [
        Text(
          "Title",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        ),
        CustomFieldButton(controller: titleController),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Description",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        ),
        CustomFieldButton(controller: descriptionController),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Quantity",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              5,
              (index) => Container(
                    width: 65,
                    height: 35,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: Colors.grey.shade400,
                    ),
                    child: Center(
                      child: Text((index + 1).toString(),
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  )),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Pick Up Time",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        ),
        CustomFieldButton(
          controller: pickUpController,
          hintText: "e.g. Today from 11:00",
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Location",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        ),
        CustomFieldButton(
          controller: locationController,
          hintText: "e.g. Ponpes Ome, Tidore Kepulauan",
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          color: goLanceMagenta,
          textColor: Colors.white,
          text: "Submit",
          onPressed: () {
            ItemRepository(store: store).addOrUpdateItem(Item(
              name: titleController.text,
              description: descriptionController.text,
              pickupTime: pickUpController.text,
              location: locationController.text,
              isUrgent: isUrgent,
              imageUrl:
                  isUrgent ? Assets.emergent_placeholder : Assets.placeholder,
            )..customer.target = widget.user);
            Navigator.pop(context);
          },
        )
      ];

  Widget buildFoodNonFoodOption() => Row(
        children: [
          Text(
            "Non Urgent",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
          ),
          Switch(
            value: isUrgent,
            onChanged: (value) => setState(() {
              isUrgent = value;
            }),
            activeColor: goLanceMagenta,
            trackColor: MaterialStatePropertyAll(
              goLanceMagenta.withOpacity(0.5),
            ),
            inactiveThumbColor: goLanceMagenta,
          ),
          Text(
            "Urgent",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
          ),
        ],
      );
}
