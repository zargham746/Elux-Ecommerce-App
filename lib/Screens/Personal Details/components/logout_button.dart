// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/constants.dart';
import '../../../services/auth_service.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          surfaceTintColor: Colors.black,
          shadowColor: Colors.black,
          minimumSize: Size(double.infinity, 60.h),
          maximumSize: Size(double.infinity, 60.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          ),
        ),
        onPressed: () async {
          await authService.signOut();
          Navigator.pushNamed(
            context,
            WelcomeScreen.routeName,
          );
        },
        icon: const Icon(
          Icons.logout_outlined,
          color: Colors.white,
        ),
        label: Text(
          'Logout',
          style: defaultStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ));
  }
}
