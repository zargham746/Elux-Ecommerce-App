import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Screens/CategoryProducts/category_products_screen.dart';
import 'package:flutter_elux_app/Widgets/category_container.dart';
import 'package:flutter_elux_app/config/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../Models/category_model.dart';
import '../../Widgets/leading_iconbutton.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = '/category';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CategoryScreen(),
    );
  }

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final List<Category> categories = [
      Category(
          categoryName: 'Shirts',
          categoryImage: 'assets/images/shirt_no_1.jpg',
          productCount: 303),
      Category(
          categoryName: 'Kurta',
          categoryImage: 'assets/images/kurta.jpg',
          productCount: 120),
      Category(
          categoryName: 'Pants',
          categoryImage: 'assets/images/pants.jpg',
          productCount: 100),
      Category(
          categoryName: 'Shoes',
          categoryImage: 'assets/images/shoe.jpg',
          productCount: 400),
      Category(
          categoryName: 'Watches',
          categoryImage: 'assets/images/watch.jpg',
          productCount: 100),
      Category(
          categoryName: 'Shirts',
          categoryImage: 'assets/images/shirt_no_1.jpg',
          productCount: 303),
      Category(
          categoryName: 'Kurta',
          categoryImage: 'assets/images/kurta.jpg',
          productCount: 120),
      Category(
          categoryName: 'Pants',
          categoryImage: 'assets/images/pants.jpg',
          productCount: 100),
      Category(
          categoryName: 'Shoes',
          categoryImage: 'assets/images/shoe.jpg',
          productCount: 400),
      Category(
          categoryName: 'Watches',
          categoryImage: 'assets/images/watch.jpg',
          productCount: 100),
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
          'All Categories',
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
                hintText: 'Search Categories',
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
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    columnCount: categories.length,
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: CategoryContainer(
                            categoryCount: categories[index].productCount,
                            categoryName: categories[index].categoryName,
                            categoryImage: categories[index].categoryImage,
                            onpress: () {
                              Navigator.pushNamed(
                                context,
                                CategoryProducts.routeName,
                              );
                            },
                            categories: categories),
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
