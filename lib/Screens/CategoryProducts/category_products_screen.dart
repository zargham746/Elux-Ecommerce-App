// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Screens/Product-View/product_view_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_elux_app/Models/product_model.dart';
import '../../Widgets/leading_iconbutton.dart';
import '../../Widgets/products_container.dart';
import '../../config/constants.dart';

class CategoryProducts extends StatefulWidget {
  static const String routeName = '/category-products';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CategoryProducts(),
    );
  }

  const CategoryProducts({super.key});

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final List<ProductModel> products = [
      ProductModel(
        image: 'assets/images/shirt_no_1.jpg',
        name: 'Shirt No 1',
        isWishlist: true,
        description: 'A Good quality Shirt',
        price: 32.00,
      ),
      ProductModel(
        image: 'assets/images/shirt_no_2.jpg',
        name: 'Shirt No 2',
        isWishlist: false,
        description: 'A Good quality Shirt',
        price: 32.00,
      ),
      ProductModel(
        image: 'assets/images/shirt_no_3.jpg',
        name: 'Shirt No 3',
        isWishlist: true,
        description: 'A Good quality Shirt',
        price: 32.00,
      ),
      ProductModel(
        image: 'assets/images/shirt_no_1.jpg',
        name: 'Shirt No 1',
        isWishlist: false,
        description: 'A Good quality Shirt',
        price: 32.00,
      ),
      ProductModel(
        image: 'assets/images/shirt_no_2.jpg',
        name: 'Shirt No 2',
        isWishlist: false,
        description: 'A Good quality Shirt',
        price: 32.00,
      ),
      ProductModel(
        image: 'assets/images/shirt_no_3.jpg',
        name: 'Shirt No 3',
        isWishlist: true,
        description: 'A Good quality Shirt',
        price: 32.00,
      ),
      ProductModel(
        image: 'assets/images/shirt_no_1.jpg',
        name: 'Shirt No 1',
        isWishlist: false,
        description: 'A Good quality Shirt',
        price: 32.00,
      ),
      ProductModel(
        image: 'assets/images/shirt_no_2.jpg',
        name: 'Shirt No 2',
        isWishlist: false,
        description: 'A Good quality Shirt',
        price: 32.00,
      ),
      ProductModel(
        image: 'assets/images/shirt_no_3.jpg',
        name: 'Shirt No 3',
        isWishlist: false,
        description: 'A Good quality Shirt',
        price: 32.00,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const LeadingIconButton(),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'All Products',
          style: defaultStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            height: 60.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(
                Radius.circular(50.r),
              ),
            ),
            child: TextFormField(
              cursorColor: Colors.black,
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search_outlined,
                ),
                prefixIconColor: Colors.black,
                hintText: 'Search Products',
                hintStyle: hintStyle,
                border: InputBorder.none,
              ),
            ),
          ),
          AnimationLimiter(
            child: Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    columnCount: products.length,
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: ProductsContainer(
                          productName: products[index].name,
                          productImage: products[index].image,
                          onpress: () {
                            Navigator.pushNamed(
                              context,
                              ProductViewScreen.routeName,
                            );
                          },
                          price: products[index].price,
                          isWishlist: products[index].isWishlist,
                          products: products,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
