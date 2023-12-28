import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Screens/Shipping%20Address/shipping_address.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants.dart';

class TotalAndCheckout extends StatelessWidget {
  const TotalAndCheckout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total(3 item)',
                style: defaultStyle.copyWith(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '\$500',
                style: defaultStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          // This will proceed the user to Checkout Screen
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                ShippingAddress.routeName,
              );
            },
            child: Container(
              height: 60.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Proceed to Checkout',
                    style: defaultStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
