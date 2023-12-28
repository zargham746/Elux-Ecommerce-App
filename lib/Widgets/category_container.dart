import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/category_model.dart';
import '../config/constants.dart';

class CategoryContainer extends StatelessWidget {
  final String categoryName;
  final String categoryImage;
  final int categoryCount;
  final VoidCallback onpress;
  const CategoryContainer({
    Key? key,
    required this.categoryCount,
    required this.categoryName,
    required this.categoryImage,
    required this.onpress,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 10.w,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onpress,
            child: Stack(
              children: [
                Container(
                  height: 150.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.r),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(categoryImage),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // horizontal, vertical offset
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 70.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    height: 60.h,
                    width: 150.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          categoryName,
                          style: defaultStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${categoryCount.toString()} products',
                          style: defaultStyle.copyWith(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
