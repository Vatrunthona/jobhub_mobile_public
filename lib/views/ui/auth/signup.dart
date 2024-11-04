import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobhub/controllers/exports.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_constants.dart';
import '../../../controllers/login_provider.dart';
import '../../common/app_bar.dart';
import '../../common/app_style.dart';
import '../../common/custom_btn.dart';
import '../../common/custom_textfield.dart';
import '../../common/height_spacer.dart';
import '../../common/reusable_text.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
 
 final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

 @override
 Widget build(BuildContext context) {
   return Consumer<SignUpNotifier>(
       builder: (context, notifier, child) {
         return Scaffold(
           appBar: PreferredSize(
             preferredSize: const Size.fromHeight(50),
             child: CustomAppBar(
               text: "Sign Up",
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
                 ReusableText(text: "Fill the details to register your account", style: appstyle(16,Color(kDarkGrey.value),FontWeight.w600),),
                 const HeightSpacer(height: 50),
                 CustomTextField(
                   keyboardType: TextInputType.text,
                   obscureText: false,
                   hintText: "Full Name",
                   controller: name,
                   validator: (value) {
                     if(value!.isEmpty) {
                       return "Please enter your name";
                     }else{
                       return null;
                     }
                   },
                 ),
                 const HeightSpacer(height: 20),
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
                   obscureText: notifier.isObsecure,
                   suffixIcon: GestureDetector(
                     child: Icon(notifier.isObsecure ? Icons.visibility : Icons.visibility_off,color: Color(kDark.value),),
                     onTap: () {
                       notifier.isObsecure = !notifier.isObsecure;
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
                   onTap: () => Get.back(),
                   child: Align(
                     alignment: Alignment.centerRight,
                     child: ReusableText(text: "Login", style: appstyle(14,Color(kDark.value),FontWeight.w600),),
                   ),
                 ),
                 const HeightSpacer(height: 20),
                 CustomButton(
                   text: "Login",
                   onTap: () {
                     if(email.text.isEmpty || !email.text.contains("@")) {
                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter a valid email")));
                     }else if(password.text.isEmpty || password.text.length < 6) {
                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter a valid password")));
                     }else{
                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Successful")));
                     }
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