import 'package:flutter/material.dart';
import 'package:go_lance/entitles/user.dart';
import 'package:go_lance/main.dart';
import 'package:go_lance/presentation/color_pallete.dart';
import 'package:go_lance/presentation/pages/main_page.dart';
import 'package:go_lance/presentation/widgets/custom_elevated_button.dart';
import 'package:go_lance/presentation/widgets/custom_text_filed.dart';
import 'package:go_lance/repositories/user_repositori.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: goLanceGreen,
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Full Name",
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                ),
                CustomFieldButton(controller: nameController),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  color: goLanceMagenta,
                  text: "Submit",
                  onPressed: () {
                    UserRepository userRepository = UserRepository(store: store);

                    User? user = userRepository.getUserByName(nameController.text) ;

                    if(user == null){
                      int id = userRepository.addOrUpdateUser(User(name: nameController.text));
                      user = userRepository.getUserById(id);
                    }

                    if(user != null){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainPage(user: user!)), (route) => route.isCurrent);
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}
