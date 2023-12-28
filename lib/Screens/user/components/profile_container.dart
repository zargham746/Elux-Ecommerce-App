import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // horizontal, vertical offset
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.w),
            height: 80.h,
            width: 80.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.w),
                ),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/profile.jpg'))),
          ),
          SizedBox(
            width: 5.w,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name of User
                Text(
                  'FastCode Developers',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: defaultStyle.copyWith(
                    fontSize: 20.sp,
                    letterSpacing: 0.1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                // Email of user
                Text(
                  'fastcodedevelopers@gmail.com',
                  style:
                      defaultStyle.copyWith(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
