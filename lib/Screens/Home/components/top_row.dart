import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopRow extends StatelessWidget {
  const TopRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // The Hamburger Menu Icon
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 40.h,
            width: 40.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/hamburger.png'),
              ),
            ),
          ),
        ),
        // Profile Icon
        GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Container(
                height: 45.h,
                width: 45.w,
                decoration: BoxDecoration(
                    color: Colors.grey[300], shape: BoxShape.circle),
              ),
              Positioned(
                top: 5.h,
                left: 5.h,
                child: SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: Image.asset('assets/icons/avatar.png'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
