import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Screens/Orders/orders_screen.dart';
import 'package:flutter_elux_app/Widgets/custom_icon_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swipeable_tile/swipeable_tile.dart';
import '../../Models/product_model.dart';
import '../../config/constants.dart';
import 'components/components.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );
  }

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ).copyWith(top: 20.h, bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Cart',
                  style: defaultStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
                CustomIconButton(
                  icon: Icons.shopping_bag_outlined,
                  onpress: () {
                    Navigator.pushNamed(context, OrderScreen.routeName);
                  },
                ),
              ],
            ),
          ),
          ...products.map(
            (ProductModel product) => SwipeableTile.card(
              color: Colors.white,
              shadow: BoxShadow(
                color: Colors.black.withOpacity(0.35),
                blurRadius: 4,
                offset: const Offset(2, 2),
              ),
              horizontalPadding: 16,
              verticalPadding: 8,
              direction: SwipeDirection.endToStart,
              onSwiped: (_) {
                final index = products.indexOf(product);

                setState(() {
                  products.removeAt(index);
                });
              },
              backgroundBuilder:
                  (_, SwipeDirection direction, AnimationController progress) {
                return AnimatedBuilder(
                  animation: progress,
                  builder: (_, __) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      color: progress.value > 0.4 ? Colors.black : Colors.black,
                      padding: EdgeInsets.only(right: 20.w),
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                );
              },
              key: UniqueKey(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Container(
                      height: 100.h,
                      width: 80.h,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(product.image),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: defaultStyle.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              product.description,
                              style: defaultStyle.copyWith(
                                  color: Colors.grey, fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${product.price.toString()}',
                              style: defaultStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            const ProductQuantityContainer(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          const PromoCodeContainer(),
          SizedBox(
            height: 50.h,
          ),
          // This contains the total of user and button that proceeds to checkout screen
          const TotalAndCheckout(),
        ],
      ),
    );
  }
}
