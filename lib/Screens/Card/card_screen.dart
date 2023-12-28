// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Models/card_model.dart';
import 'package:flutter_elux_app/Widgets/leading_iconbutton.dart';
import 'package:flutter_elux_app/config/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Models/product_model.dart';
import 'components/components.dart';

class CardScreen extends StatefulWidget {
  static const String routeName = '/card';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CardScreen(),
    );
  }

  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final List<CardModel> cards = [
    CardModel(
        cardName: 'Apple Pay',
        cardNumber: '1234 5678 8765 4321',
        cardHolderName: 'Anita Kubrani',
        validDate: DateTime(2030, 5),
        cardTypeImage: 'assets/icons/apple.png'),
    CardModel(
        cardName: 'Paypal',
        cardNumber: '1234 5678 8765 4321',
        cardHolderName: 'Anita Kubrani',
        validDate: DateTime(2030, 5),
        cardTypeImage: 'assets/icons/paypal.png'),
    CardModel(
        cardName: 'Visa',
        cardNumber: '1234 5678 8765 4321',
        cardHolderName: 'Anita Kubrani',
        validDate: DateTime(2030, 5),
        cardTypeImage: 'assets/icons/visa.png'),
    CardModel(
        cardName: 'Google Pay',
        cardNumber: '1234 5678 8765 4321',
        cardHolderName: 'Anita Kubrani',
        validDate: DateTime(2030, 5),
        cardTypeImage: 'assets/icons/search.png'),
  ];
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingIconButton(),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          const PaymentText(),
          SliverList(
            delegate: SliverChildBuilderDelegate(childCount: cards.length,
                (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // horizontal, vertical offset
                    ),
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.r),
                          margin: EdgeInsets.only(left: 10.w),
                          height: 40.h,
                          width: 40.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                          ),
                          child: Image.asset(
                            cards[index].cardTypeImage,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          cards[index].cardName,
                          style: defaultStyle.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: const Icon(
                        Icons.circle_outlined,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          const AddCardContainer(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Text(
                'History',
                style: defaultStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                  letterSpacing: 0.9,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: products.length,
              (context, index) {
                return Container(
                  height: 120.h,
                  width: double.infinity,
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // horizontal, vertical offset
                      ),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            height: 100.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(products[index].image),
                              ),
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.r),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  products[index].name,
                                  style: defaultStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                      letterSpacing: 0.2),
                                ),
                                Text(
                                  products[index].description,
                                  style: defaultStyle.copyWith(
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                  height: 20.h,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 2.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.r),
                                    ),
                                    color: Colors.grey[200],
                                  ),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: Colors.black,
                                          size: 12.sp,
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Text(
                                          'Sent',
                                          style: defaultStyle.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
