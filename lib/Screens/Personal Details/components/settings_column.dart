import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elux_app/config/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsColumn extends StatefulWidget {
  const SettingsColumn({super.key});

  @override
  State<SettingsColumn> createState() => _SettingsColumnState();
}

class _SettingsColumnState extends State<SettingsColumn> {
  @override
  Widget build(BuildContext context) {
    String dropdownLanguage = 'English';
    bool notificationSwitch = true;
    bool darkMode = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings',
          style: defaultStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 22.sp,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 30.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1.5,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20.w),
            ),
          ),
          child: Column(
            children: [
              // Language Row
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Icon and Name Row
                    Row(
                      children: [
                        Container(
                          height: 40.h,
                          width: 40.w,
                          padding: EdgeInsets.all(10.h),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Image.asset("assets/icons/global.png"),
                          ),
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        Text(
                          'Language',
                          style: defaultStyle.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        DropdownButton<String>(
                          elevation: 3,
                          iconEnabledColor: Colors.grey,
                          iconDisabledColor: Colors.grey,
                          value: dropdownLanguage,
                          items: <String>['English', 'Urdu', 'Default']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: defaultStyle.copyWith(
                                    fontSize: 12.sp, color: Colors.grey),
                              ),
                            );
                          }).toList(),
                          // Step 5.
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownLanguage = newValue!;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.sp,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              // Notifications Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        padding: EdgeInsets.all(10.h),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Center(
                          child: Image.asset("assets/icons/bell-ring.png"),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Notifications',
                        style: defaultStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                    ],
                  ),
                  CupertinoSwitch(
                    activeColor: Colors.black,
                    value: notificationSwitch,
                    onChanged: (value) {
                      setState(() {
                        notificationSwitch = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              // Dark Mode Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        padding: EdgeInsets.all(10.h),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Center(
                          child: Image.asset("assets/icons/night-mode.png"),
                        ),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Text(
                        'Dark Mode',
                        style: defaultStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        darkMode == true ? 'On' : 'off',
                        style: defaultStyle.copyWith(
                            fontSize: 14.sp, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      CupertinoSwitch(
                        activeColor: Colors.black,
                        value: darkMode,
                        onChanged: (value) {
                          setState(() {
                            darkMode = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              // Help Center Row
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40.h,
                          width: 40.w,
                          padding: EdgeInsets.all(10.h),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Image.asset("assets/icons/question.png"),
                          ),
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        Text(
                          'Help Center',
                          style: defaultStyle.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16.sp),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 16.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
