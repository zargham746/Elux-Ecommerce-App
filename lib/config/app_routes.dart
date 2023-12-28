import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Screens/Add%20Card/add_card_screen.dart';
import 'package:flutter_elux_app/Screens/Card/card_screen.dart';
import 'package:flutter_elux_app/Screens/Category/category_screen.dart';
import 'package:flutter_elux_app/Screens/CategoryProducts/category_products_screen.dart';
import 'package:flutter_elux_app/Screens/FAQ/faq_screen.dart';
import 'package:flutter_elux_app/Screens/Favorites/favorite_screen.dart';
import 'package:flutter_elux_app/Screens/Home/home_screen.dart';
import 'package:flutter_elux_app/Screens/Login/login_screen.dart';
import 'package:flutter_elux_app/Screens/Messages/messages_screen.dart';
import 'package:flutter_elux_app/Screens/Notifications/notifications_screen.dart';
import 'package:flutter_elux_app/Screens/Orders/orders_screen.dart';
import 'package:flutter_elux_app/Screens/Personal%20Details/personal_details_screen.dart';
import 'package:flutter_elux_app/Screens/Product-View/product_view_screen.dart';
import 'package:flutter_elux_app/Screens/Register/register_screen.dart';
import 'package:flutter_elux_app/Screens/Shipping%20Address/shipping_address.dart';
import 'package:flutter_elux_app/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_elux_app/Screens/cart/cart_screen.dart';
import 'package:flutter_elux_app/Screens/user/user_screen.dart';
import 'package:flutter_elux_app/Widgets/custom_navbar.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('Route: ${settings.name}');
    }

    switch (settings.name) {
      case CustomNavBar.routeName:
        return CustomNavBar.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case UserScreen.routeName:
        return UserScreen.route();
      case NotificationScreen.routeName:
        return NotificationScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case OrderScreen.routeName:
        return OrderScreen.route();
      case CategoryScreen.routeName:
        return CategoryScreen.route();
      case PersonalDetailScreen.routeName:
        return PersonalDetailScreen.route();
      case FavoriteScreen.routeName:
        return FavoriteScreen.route();
      case ShippingAddress.routeName:
        return ShippingAddress.route();
      case CardScreen.routeName:
        return CardScreen.route();
      case AddCardScreen.routeName:
        return AddCardScreen.route();
      case MessagesScreen.routeName:
        return MessagesScreen.route();
      case FaqScreen.routeName:
        return FaqScreen.route();
      case WelcomeScreen.routeName:
        return WelcomeScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case RegisterScreen.routeName:
        return RegisterScreen.route();
      case CategoryProducts.routeName:
        return CategoryProducts.route();
      case ProductViewScreen.routeName:
        return ProductViewScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
