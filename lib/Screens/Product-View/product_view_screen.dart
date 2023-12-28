import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Screens/FAQ/components/components.dart';
import 'package:flutter_elux_app/Screens/Favorites/favorite_screen.dart';
import 'package:flutter_elux_app/Screens/Orders/orders_screen.dart';
import 'package:flutter_elux_app/Screens/cart/components/components.dart';
import 'package:flutter_elux_app/Widgets/custom_icon_button.dart';
import 'package:flutter_elux_app/Widgets/leading_iconbutton.dart';
import 'package:flutter_elux_app/config/constants.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductViewScreen extends StatefulWidget {
  static const String routeName = '/product-view-screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ProductViewScreen(),
    );
  }

  const ProductViewScreen({super.key});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  List<String> choices = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];
  List<Color> colors = [
    Colors.pink,
    Colors.green,
    Colors.black,
    Colors.blue,
  ];
  double value = 3.5;
  String selectedChoice = 'S';
  Color selectedColor = Colors.pink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const LeadingIconButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomIconButton(
              icon: Icons.shopping_bag_outlined,
              onpress: () {
                Navigator.pushNamed(
                  context,
                  OrderScreen.routeName,
                );
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),

          // Photo Container
          Container(
            width: 375.w,
            height: 500.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/shirt_no_3.jpg'),
              ),
            ),
          ),
          Positioned(
            right: 10.w,
            top: 350.h,
            child: CustomIconButton(
              icon: Icons.favorite_border_outlined,
              onpress: () {
                Navigator.pushNamed(
                  context,
                  FavoriteScreen.routeName,
                );
              },
            ),
          ),
          // Products Details Container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 400.h,
              width: 375.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    30.r,
                  ),
                  topRight: Radius.circular(
                    30.r,
                  ),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ).copyWith(
                  top: 30.h,
                ),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // The Product Name, Description and Rating Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shirt No 3',
                            style: defaultStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'A great quality shirt',
                            style: defaultStyle.copyWith(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          // Rating Stars
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RatingStars(
                                value: value,
                                onValueChanged: (v) {
                                  //
                                  setState(() {
                                    value = v;
                                  });
                                },
                                starBuilder: (index, color) => Icon(
                                  Icons.star,
                                  color: color,
                                  size: 18.sp,
                                ),
                                starCount: 5,
                                starSize: 18.sp,
                                starSpacing: 1.w,
                                valueLabelVisibility: false,
                                animationDuration:
                                    const Duration(milliseconds: 1000),
                                starOffColor: const Color(0xffe7e8ea),
                                starColor: Colors.yellow,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                '(36 Reviews)',
                                style: defaultStyle.copyWith(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // The product number, stock
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const ProductQuantityContainer(),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'Available in Stock',
                            style: defaultStyle.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // Size Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Size',
                        style: defaultStyle.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 70.h,
                        width: 300.w,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: choices.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  right: 5.w,
                                ),
                                child: ChoiceChip(
                                  selectedShadowColor: Colors.transparent,
                                  backgroundColor: Colors.white,
                                  surfaceTintColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  selectedColor: Colors.black,
                                  disabledColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100.r),
                                    ),
                                  ),
                                  side: const BorderSide(
                                    width: 1.0,
                                    color: Colors.black,
                                  ),
                                  label: Text(
                                    choices[index],
                                    style: selectedChoice == choices[index]
                                        ? defaultStyle.copyWith(
                                            fontSize: 12.sp,
                                            color: Colors.white,
                                          )
                                        : defaultStyle.copyWith(
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                          ),
                                  ),
                                  selected: selectedChoice == choices[index],
                                  onSelected: (selected) {
                                    setState(() {
                                      selectedChoice =
                                          selected ? choices[index] : '';
                                    });
                                  },
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  // Colors Selection Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Colors',
                        style: defaultStyle.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        height: 70.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              100.r,
                            ),
                          ),
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: colors.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  right: 5.w,
                                ),
                                child: ChoiceChip(
                                  selectedShadowColor: Colors.transparent,
                                  backgroundColor: colors[index],
                                  surfaceTintColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  selectedColor: colors[index],
                                  disabledColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100.r),
                                    ),
                                  ),
                                  label: const Text(
                                    '',
                                  ),
                                  selected: selectedColor == colors[index],
                                  onSelected: (selected) {
                                    setState(() {
                                      selectedColor = selected
                                          ? colors[index]
                                          : Colors.transparent;
                                    });
                                  },
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      // Product description
                      const CustomExpansionTile(
                        title: 'Description',
                        description:
                            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. ',
                      ),
                      // Prcie and Add to Cart
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Price Column
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Price',
                                style: defaultStyle.copyWith(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                '\$32.00',
                                style: defaultStyle.copyWith(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              showSnackbar(
                                context,
                                Colors.black,
                                'Added to Cart',
                              );
                            },
                            icon: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                            label: Text(
                              'Add to Cart',
                              style: defaultStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                              fixedSize: Size.fromHeight(
                                60.h,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
