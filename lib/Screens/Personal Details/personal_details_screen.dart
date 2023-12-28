// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Widgets/leading_iconbutton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_elux_app/config/constants.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../Widgets/custom_textfield.dart';
import 'components/components.dart';

class PersonalDetailScreen extends StatefulWidget {
  static const String routeName = '/personaldetails';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const PersonalDetailScreen(),
    );
  }

  const PersonalDetailScreen({super.key});

  @override
  State<PersonalDetailScreen> createState() => _PersonalDetailScreenState();
}

class _PersonalDetailScreenState extends State<PersonalDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _userNameController =
        TextEditingController(text: 'FastCodeDevelopers');
    final TextEditingController _ageController =
        TextEditingController(text: '22 years');
    final TextEditingController _emailController =
        TextEditingController(text: 'fastcodedevelopers@gmail.com');
    String dropdownValue = 'Male';

    return Scaffold(
      appBar: AppBar(
        leading: const LeadingIconButton(),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 300),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const ProfilePhoto(),
                SizedBox(height: 20.h),
                // Name Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: Text(
                        'Name',
                        style: defaultStyle.copyWith(
                          color: Colors.grey,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    CustomTextField(controller: _userNameController),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                // Gender Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: Text(
                        'Gender',
                        style: defaultStyle.copyWith(
                          color: Colors.grey,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    DropdownButton<String>(
                      elevation: 3,
                      value: dropdownValue,
                      items: <String>['Male', 'Female', 'Prefer Not to Say']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: defaultStyle.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        );
                      }).toList(),
                      // Step 5.
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                // Age Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: Text(
                        'Age',
                        style: defaultStyle.copyWith(
                          color: Colors.grey,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    CustomTextField(controller: _ageController),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                // Email Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: Text(
                        'Email',
                        style: defaultStyle.copyWith(
                          color: Colors.grey,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    CustomTextField(controller: _emailController),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                const SettingsColumn(),
                SizedBox(
                  height: 20.h,
                ),
                const LogoutButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
