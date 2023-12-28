import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Widgets/leading_iconbutton.dart';
import 'package:flutter_elux_app/config/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../Models/product_model.dart';

class FavoriteScreen extends StatelessWidget {
  static const String routeName = '/favorite';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const FavoriteScreen(),
    );
  }

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> products = [
      ProductModel(
          image: 'assets/images/shirt_no_1.jpg',
          name: 'Shirt No 1',
          isWishlist: true,
          description: 'Quality Shirt',
          price: 35.00),
      ProductModel(
          image: 'assets/images/shirt_no_2.jpg',
          name: 'Shirt No 2',
          isWishlist: true,
          description: 'Quality Shirt',
          price: 35.00),
      ProductModel(
          image: 'assets/images/shirt_no_3.jpg',
          name: 'Shirt No 3',
          isWishlist: true,
          description: 'Quality Shirt',
          price: 35.00),
      ProductModel(
          image: 'assets/images/shirt_no_1.jpg',
          name: 'Shirt No 1',
          isWishlist: true,
          description: 'Quality Shirt',
          price: 35.00),
      ProductModel(
          image: 'assets/images/shirt_no_2.jpg',
          name: 'Shirt No 2',
          isWishlist: true,
          description: 'Quality Shirt',
          price: 35.00),
      ProductModel(
          image: 'assets/images/shirt_no_3.jpg',
          name: 'Shirt No 3',
          isWishlist: true,
          description: 'Quality Shirt',
          price: 35.00),
      ProductModel(
          image: 'assets/images/shirt_no_1.jpg',
          name: 'Shirt No 1',
          isWishlist: true,
          description: 'Quality Shirt',
          price: 35.00),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const LeadingIconButton(),
        title: Text(
          'My Favorites',
          style: defaultStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 20.sp, letterSpacing: 0.9),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: AnimationLimiter(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 15.h),
                          height: 120.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // horizontal, vertical offset
                              ),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.r),
                            ),
                            color: Colors.grey[300],
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                              image: AssetImage(products[index].image),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          margin: EdgeInsets.only(bottom: 10.h),
                          height: 120.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.r),
                            ),
                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    products[index].name,
                                    style: defaultStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    products[index].description,
                                    style: defaultStyle.copyWith(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  Text(
                                    '\$${products[index].price}',
                                    style: defaultStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black),
                                child: Text(
                                  'Shop Now',
                                  style: defaultStyle.copyWith(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
