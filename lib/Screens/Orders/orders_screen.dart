import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Widgets/leading_iconbutton.dart';
import 'package:flutter_elux_app/config/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../Models/product_model.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = '/order';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OrderScreen(),
    );
  }

  const OrderScreen({super.key});

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
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'My Orders',
          style: defaultStyle.copyWith(
              fontSize: 18.sp, fontWeight: FontWeight.bold, letterSpacing: 0.8),
        ),
        leading: const LeadingIconButton(),
      ),
      body: DefaultTabController(
        length: 2, // The number of tabs

        child: Column(
          children: <Widget>[
            TabBar(
              labelStyle: defaultStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
              indicatorColor: Colors.black,
              unselectedLabelStyle: defaultStyle.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                  color: Colors.grey),
              overlayColor: MaterialStateProperty.all<Color>(Colors.black12),
              physics: const BouncingScrollPhysics(),
              labelColor: Colors.black,
              tabs: const <Tab>[
                Tab(
                  text: 'Ongoing',
                ),
                Tab(
                  text: 'Completed',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  // Ongoing Orders ListView
                  AnimationLimiter(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 500),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  height: 120.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0,
                                            3), // horizontal, vertical offset
                                      ),
                                    ],
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 5.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Product Image Container
                                        Row(
                                          children: [
                                            Container(
                                              height: 100.h,
                                              width: 80.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                color: Colors.black,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      products[index].image),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Text(
                                                  products[index].name,
                                                  style: defaultStyle.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.sp),
                                                ),
                                                Text(
                                                  products[index].description,
                                                  style: defaultStyle.copyWith(
                                                      color: Colors.grey,
                                                      fontSize: 12.sp),
                                                ),
                                                Text(
                                                  products[index].isWishlist
                                                      ? 'Added to Wishlist'
                                                      : '',
                                                  style: defaultStyle.copyWith(
                                                      color: Colors.grey,
                                                      fontSize: 12.sp),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '\$${products[index].price}',
                                          style: defaultStyle.copyWith(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  // Completed Orders ListView
                  AnimationLimiter(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        itemCount: products.length - 1,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 500),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  height: 120.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0,
                                            3), // horizontal, vertical offset
                                      ),
                                    ],
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 5.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Product Image Container
                                        Row(
                                          children: [
                                            Container(
                                              height: 100.h,
                                              width: 80.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                color: Colors.black,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      products[index].image),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Text(
                                                  products[index].name,
                                                  style: defaultStyle.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.sp),
                                                ),
                                                Text(
                                                  products[index].description,
                                                  style: defaultStyle.copyWith(
                                                      color: Colors.grey,
                                                      fontSize: 12.sp),
                                                ),
                                                Text(
                                                  products[index].isWishlist
                                                      ? 'Added to Wishlist'
                                                      : '',
                                                  style: defaultStyle.copyWith(
                                                      color: Colors.grey,
                                                      fontSize: 12.sp),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '\$${products[index].price}',
                                          style: defaultStyle.copyWith(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
