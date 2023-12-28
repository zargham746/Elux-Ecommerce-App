import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants.dart';

class PromoCodeContainer extends StatelessWidget {
  const PromoCodeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // horizontal, vertical offset
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 65.h,
            width: 65.w,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            child: Image.asset('assets/icons/voucher.png'),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Add Promo Code',
                style: defaultStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
              Text(
                '#12543G',
                style: defaultStyle.copyWith(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
