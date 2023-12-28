import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Screens/FAQ/faq_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_listtile.dart';

class BottomContainer extends StatefulWidget {
  const BottomContainer({
    super.key,
  });

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  final Uri _url = Uri.parse('https://www.lipsum.com/');
  Future<void> _launchUrl() async {
    if (!await launchUrl(
      _url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $_url');
    }
  }

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
            title: 'FAQs',
            onTap: () {
              Navigator.pushNamed(context, FaqScreen.routeName);
            },
            imageName: 'faq',
          ),
          CustomListTile(
            title: 'Privacy Policy',
            onTap: _launchUrl,
            imageName: 'privacy',
          ),
          CustomListTile(
            title: 'About us',
            onTap: _launchUrl,
            imageName: 'about',
          ),
        ],
      ),
    );
  }
}
