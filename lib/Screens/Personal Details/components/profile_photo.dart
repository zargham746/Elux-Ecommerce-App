import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.r),
                  ),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.w,
                right: 0.w,
                height: 30.w,
                child: GestureDetector(
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    padding: EdgeInsets.all(7.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100.w),
                      ),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 14.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Upload Image',
            style: defaultStyle.copyWith(
                fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
