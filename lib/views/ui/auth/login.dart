import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/controllers/exports.dart';
import 'package:jobhub/views/common/app_bar.dart';
import 'package:jobhub/views/common/app_style.dart';
import 'package:jobhub/views/common/custom_btn.dart';
import 'package:jobhub/views/common/custom_textfield.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/ui/auth/signup.dart';
import 'package:jobhub/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';

import '../../common/reusable_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, notifier, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              text: "Login",
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const HeightSpacer(height: 50),
                ReusableText(text: "Welcome Back!", style: appstyle(30,Color(kDark.value),FontWeight.w600)),
                ReusableText(text: "Fill the details to login your account", style: appstyle(16,Color(kDarkGrey.value),FontWeight.w600),),
                const HeightSpacer(height: 50),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  hintText: "Email",
                  controller: email,
                  validator: (value) {
                    if(value!.isEmpty || !value.contains("@")) {
                      return "Please enter a valid email";
                    }else{
                      return null;
                    }
                  },
                ),
                const HeightSpacer(height: 20),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: notifier.obscureText,
                  suffixIcon: GestureDetector(
                    child: Icon(notifier.obscureText ? Icons.visibility : Icons.visibility_off,color: Color(kDark.value),),
                    onTap: () {
                      notifier.obscureText = !notifier.obscureText;
                    },
                  ),
                  hintText: "Password",
                  controller: password,
                  validator: (value) {
                    if(value!.isEmpty || value.length < 6) {
                      return "Please enter a valid password";
                    }else{
                      return null;
                    }
                  },
                ),
                const HeightSpacer(height: 10),
                GestureDetector(
                  onTap: () => Get.to(() => const RegistrationPage()),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ReusableText(text: "Register", style: appstyle(14,Color(kDark.value),FontWeight.w600),),
                  ),
                ),
                const HeightSpacer(height: 20),
                CustomButton(
                  text: "Login",
                  onTap: () {
                   Get.to(() => const MainScreen());
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
