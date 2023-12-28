// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Widgets/custom_button.dart';
import 'package:flutter_elux_app/Widgets/custom_loading_button.dart';
import 'package:flutter_elux_app/Widgets/custom_navbar.dart';
import 'package:flutter_elux_app/Widgets/leading_iconbutton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Config/helper_functions.dart';
import '../../Widgets/logo_container.dart';
import '../../config/constants.dart';
import '../../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const RegisterScreen(),
    );
  }

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: const LeadingIconButton(),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const LogoContainer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "CREATE ACCOUNT",
                      style: defaultStyle.copyWith(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Text(
                        "Create a new account and explore ELUX",
                        style: defaultStyle.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      style: defaultStyle.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.r),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.20),
                        hintText: "Full Name",
                        hintStyle: defaultStyle.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                      onChanged: (val) {
                        setState(() {
                          fullName = val;
                        });
                      },
                      validator: (val) {
                        if (val!.isNotEmpty) {
                          return null;
                        } else {
                          return "Name cannot be empty";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,

                      style: defaultStyle.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.r),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.20),
                        hintText: "Email",
                        hintStyle: defaultStyle.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },

                      // check tha validation
                      validator: (val) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val!)
                            ? null
                            : "Please enter a valid email";
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      style: defaultStyle.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.r),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.20),
                        hintText: "Password",
                        hintStyle: defaultStyle.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                      validator: (val) {
                        if (val!.length < 6) {
                          return "Password must be at least 6 characters";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    // CustomGradientButton(
                    //   buttonLabel: "REGISTER",
                    //   onpress: register,
                    // ),
                    _isLoading
                        ? CustomLoadingButton(onpress: () {})
                        : CustomButton(
                            onpress: register, buttonLabel: "REGISTER"),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  // This function will help user register to the app
  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) async {
        if (value == true) {
          // saving the shared preference state
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(fullName);
          Navigator.pushReplacementNamed(
            context,
            CustomNavBar.routeName,
          );
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
