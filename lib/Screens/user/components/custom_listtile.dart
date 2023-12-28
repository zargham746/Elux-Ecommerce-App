import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/constants.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String imageName;
  const CustomListTile({
    Key? key,
    required this.title,
    required this.onTap,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.grey,
      padding: EdgeInsets.symmetric(horizontal: 3.w,),

      onPressed: onTap,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w,),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Image.asset("assets/icons/$imageName.png"),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  title,
                  style: defaultStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
