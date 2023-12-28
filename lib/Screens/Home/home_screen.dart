import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Screens/Category/category_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_elux_app/Models/models.dart';
import 'package:flutter_elux_app/config/constants.dart';

import '../../Widgets/category_container.dart';
import 'components/home_components.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tabNames = ['Dresses', 'Jackets', 'Jeans', 'Shoes'];

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 30.h,
              ),
              child: const TopRow(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome,',
                    style: defaultStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Our Fashion App',
                    style: defaultStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: const SearchRow(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: const HotDeal(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: defaultStyle.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  // This will take us to the Category Screen that consist of all the categories
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CategoryScreen.routeName);
                    },
                    child: Text(
                      'View All',
                      style: defaultStyle.copyWith(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryContainer(
                    categoryCount: categories[0].productCount,
                    categoryName: categories[0].categoryName,
                    categoryImage: categories[0].categoryImage,
                    onpress: () {},
                    categories: categories,
                  ),
                  CategoryContainer(
                    categoryCount: categories[1].productCount,
                    categoryName: categories[1].categoryName,
                    categoryImage: categories[1].categoryImage,
                    onpress: () {},
                    categories: categories,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
