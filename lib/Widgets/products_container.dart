import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Models/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/constants.dart';

class ProductsContainer extends StatelessWidget {
  final String productName;
  final String productImage;
  final VoidCallback onpress;
  final double price;
  final bool isWishlist;
  const ProductsContainer({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.onpress,
    required this.price,
    required this.isWishlist,
    required this.products,
  }) : super(key: key);

  final List<ProductModel> products;

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
                      image: AssetImage(productImage),
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                productName,
                                style: defaultStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Price: \$${price.toString()}',
                                style: defaultStyle.copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          isWishlist
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.black,
                                ),
                        ],
                      ),
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
