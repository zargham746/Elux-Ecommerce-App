import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Row(
      children: [
        // The Search Bar TextField
        Flexible(
          child: SizedBox(
            height: 50.h,
            width: double.infinity,
            child: TextFormField(
              controller: searchController,
              cursorColor: Colors.black,
              cursorHeight: 25.h,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: hintStyle,
                fillColor: const Color(0xfff3f4f6),
                filled: true,
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide.none),
                disabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide.none),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide.none),
                errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide.none),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide.none),
                focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        // The Filter Button
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 50.h,
            width: 50.h,
            padding: EdgeInsets.all(10.h),
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
            child: Image.asset('assets/icons/filter.png'),
          ),
        )
      ],
    );
  }
}
