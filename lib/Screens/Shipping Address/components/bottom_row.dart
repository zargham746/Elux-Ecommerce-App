import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants.dart';

class BottomRow extends StatelessWidget {
  const BottomRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Price',
              style: defaultStyle.copyWith(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),
            Text(
              '\$443.00',
              style: defaultStyle.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        //Place Order Button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            fixedSize: Size(150.w, 60.h),
          ),
          onPressed: () {},
          child: Text(
            'Place Order',
            style: defaultStyle.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
