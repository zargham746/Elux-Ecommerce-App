import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 80.w,
      ),
      padding: EdgeInsets.all(
        30.w,
      ),
      child: Image.asset('assets/icons/shopping-cart.png'),
    );
  }
}
