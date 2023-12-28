import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onpress;
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // horizontal, vertical offset
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: IconButton(
          onPressed: onpress,
          icon: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
