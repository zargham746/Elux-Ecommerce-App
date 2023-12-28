// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/components.dart';

class UserScreen extends StatelessWidget {
  static const String routeName = '/user';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const UserScreen(),
    );
  }

  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              // Contains Profile Picture, Name and Email Address
              const ProfileContainer(),
              SizedBox(
                height: 30.h,
              ),
              // Contains Different Tiles That Link to Pages like personal details page,
              // My Order Page, Favorites page , Shipping Address Page , Credits page and settings page
              const MiddleContainer(),
              SizedBox(
                height: 30.h,
              ),
              // Similarly as above, contains different Tiles that Link to Pages like FAQ`s page,
              // Privacy Policy as well as about us page
              const BottomContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
