import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants.dart';

class HotDeal extends StatelessWidget {
  const HotDeal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 120.h,
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
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Product Image Container
                  Container(
                    height: 100.h,
                    width: 80.w,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.black,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/shoe.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  // The Product Description Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Axel Arigato',
                        style: defaultStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Clean 90 triple sneakers',
                        style: defaultStyle.copyWith(
                            color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        '\$245.00',
                        style:
                            defaultStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 30.h,
                width: 30.h,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.h),
                  ),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 20.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
