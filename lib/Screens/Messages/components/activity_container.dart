import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants.dart';

class ActivityContainer extends StatelessWidget {
  final String imagename;
  final String userName;
  const ActivityContainer({
    Key? key,
    required this.userName,
    required this.imagename,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10.w),
          padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
              border: Border.all(
                width: 2.5,
                color: Colors.green,
              ),
              shape: BoxShape.circle),
          child: CircleAvatar(
            radius: 50.r,
            backgroundColor: Colors.grey[300],
            backgroundImage: AssetImage(imagename),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          userName,
          style: defaultStyle.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
            letterSpacing: 0.6,
          ),
        ),
      ],
    );
  }
}
