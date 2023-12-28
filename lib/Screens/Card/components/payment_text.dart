import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants.dart';

class PaymentText extends StatelessWidget {
  const PaymentText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Text(
          'Payment',
          style: defaultStyle.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
            fontSize: 22.sp,
          ),
        ),
      ),
    );
  }
}
