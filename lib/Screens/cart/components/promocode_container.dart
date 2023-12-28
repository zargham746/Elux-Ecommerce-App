import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants.dart';

class PromoCodeContainer extends StatelessWidget {
  const PromoCodeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          height: 70.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.grey[100],
          ),
          child: Center(
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: InputBorder.none, // Removes the underline
                hintText: 'Promo Code',
                hintStyle:
                    defaultStyle.copyWith(fontSize: 14.sp, color: Colors.grey),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10.h,
          right: 30.w,
          child: Container(
            height: 50.h,
            width: 100.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(10.w),
              ),
            ),
            child: Center(
              child: Text(
                'Apply',
                style: defaultStyle.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
