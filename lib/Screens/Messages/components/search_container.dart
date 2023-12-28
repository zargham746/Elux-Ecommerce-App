import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.messageSearchController,
  });

  final TextEditingController messageSearchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.all(
          Radius.circular(50.r),
        ),
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: messageSearchController,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search_outlined,
          ),
          prefixIconColor: Colors.black,
          hintText: 'Search...',
          hintStyle: hintStyle,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
