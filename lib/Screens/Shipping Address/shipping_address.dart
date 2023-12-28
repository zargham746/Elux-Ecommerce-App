// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_elux_app/Widgets/leading_iconbutton.dart';
import 'package:flutter_elux_app/config/constants.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'components/components.dart';

class ShippingAddress extends StatelessWidget {
  static const String routeName = '/shippingaddress';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ShippingAddress(),
    );
  }

  const ShippingAddress({super.key});

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
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: AnimationLimiter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 300),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 20.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  Text(
                    'Delivery Address',
                    style: defaultStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
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
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.r),
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AddressRow(
                          title: 'Street',
                          description: '3512 Pearl Street',
                        ),
                        AddressRow(
                          title: 'City',
                          description: 'Jhelum',
                        ),
                        AddressRow(
                          title: 'State/Province/Area',
                          description: 'Punjab',
                        ),
                        AddressRow(
                          title: 'Phone Number',
                          description: '0312 3456789',
                        ),
                        AddressRow(
                          title: 'Country Calling Code',
                          description: '+92',
                        ),
                        AddressRow(
                          title: 'Country',
                          description: 'Pakistan',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Product Item',
                    style: defaultStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const ProductItem(
                    imageName: 'shoe',
                    name: 'Axel Arigato',
                    description: 'Clean 90 triple Sneakers',
                    price: 245.00,
                  ),
                  const ProductItem(
                    imageName: 'pants',
                    name: 'Dress Pants',
                    description: 'Vintage Pants by Armani',
                    price: 245.00,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Promo Code',
                    style: defaultStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const PromoCodeContainer(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const BottomRow(),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
