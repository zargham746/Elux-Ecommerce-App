import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Screens/Card/card_screen.dart';
import 'package:flutter_elux_app/Screens/Favorites/favorite_screen.dart';
import 'package:flutter_elux_app/Screens/Messages/messages_screen.dart';
import 'package:flutter_elux_app/Screens/Orders/orders_screen.dart';
import 'package:flutter_elux_app/Screens/Personal%20Details/personal_details_screen.dart';
import 'package:flutter_elux_app/Screens/Shipping%20Address/shipping_address.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_listtile.dart';

class MiddleContainer extends StatelessWidget {
  const MiddleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1.5,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.w),
        ),
      ),
      child: Column(
        children: [
          CustomListTile(
              title: 'Personal Details',
              onTap: () {
                Navigator.pushNamed(context, PersonalDetailScreen.routeName);
              },
              imageName: 'user'),
          CustomListTile(
              title: 'My Order',
              onTap: () {
                Navigator.pushNamed(context, OrderScreen.routeName);
              },
              imageName: 'bag'),
          CustomListTile(
              title: 'My Favorites',
              onTap: () {
                Navigator.pushNamed(context, FavoriteScreen.routeName);
              },
              imageName: 'favorite'),
          CustomListTile(
              title: 'My Shipping Address',
              onTap: () {
                Navigator.pushNamed(context, ShippingAddress.routeName);
              },
              imageName: 'truck'),
          CustomListTile(
              title: 'My Card',
              onTap: () {
                Navigator.pushNamed(context, CardScreen.routeName);
              },
              imageName: 'card'),
          CustomListTile(
              title: 'Inbox',
              onTap: () {
                Navigator.pushNamed(context, MessagesScreen.routeName);
              },
              imageName: 'send'),
        ],
      ),
    );
  }
}
