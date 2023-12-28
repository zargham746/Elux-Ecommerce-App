import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductQuantityContainer extends StatelessWidget {
  const ProductQuantityContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.grey[300],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.remove,
              color: Colors.black,
              size: 12.h,
            ),
          ),
          const Text('1'),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.black,
              size: 12.h,
            ),
          ),
        ],
      ),
    );
  }
}
