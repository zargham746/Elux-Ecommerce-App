import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Models/message_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_elux_app/Widgets/leading_iconbutton.dart';
import 'package:flutter_elux_app/config/constants.dart';

import 'components/components.dart';

class MessagesScreen extends StatefulWidget {
  static const String routeName = '/message';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const MessagesScreen(),
    );
  }

  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController messageSearchController = TextEditingController();
  final List<MessageModel> messages = [
    MessageModel(
      imageName: 'assets/images/user_1.jpg',
      name: 'Cheryl',
      message: 'When will my Package Arrive?',
      timestamp: DateTime.now(),
    ),
    MessageModel(
      imageName: 'assets/images/user_2.jpg',
      name: 'John',
      message: 'I want three more pairs of shoes like this.',
      timestamp: DateTime.now(),
    ),
    MessageModel(
      imageName: 'assets/images/user_3.jpg',
      name: 'Bobby',
      message: 'How to have express delivery?',
      timestamp: DateTime.now(),
    ),
    MessageModel(
      imageName: 'assets/images/user_4.jpg',
      name: 'Steve',
      message:
          'I want to place a custom order for my\nbusiness party. How can I order?',
      timestamp: DateTime.now(),
    ),
    MessageModel(
      imageName: 'assets/images/user_2.jpg',
      name: 'John',
      message: 'I want three more pairs of shoes like this.',
      timestamp: DateTime.now(),
    ),
    MessageModel(
      imageName: 'assets/images/user_3.jpg',
      name: 'Bobby',
      message: 'How to have express delivery?',
      timestamp: DateTime.now(),
    ),
    MessageModel(
      imageName: 'assets/images/user_4.jpg',
      name: 'Steve',
      message:
          'I want to place a custom order for my\nbusiness party. How can I order?',
      timestamp: DateTime.now(),
    ),
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
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: SearchContainer(
                    messageSearchController: messageSearchController),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text(
                  'Activities',
                  style: defaultStyle.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 160.h,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                      left: 20.w,
                      top: 5.h,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return ActivityContainer(
                          userName: messages[index].name,
                          imagename: messages[index].imageName);
                    }),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text(
                  'Messages',
                  style: defaultStyle.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
            ),
            SliverList.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    children: [
                      Container(
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2.5,
                              color: Colors.green,
                            ),
                            shape: BoxShape.circle),
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: Colors.grey[300],
                          backgroundImage:
                              AssetImage(messages[index].imageName),
                        ),
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            messages[index].name,
                            style: defaultStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Text(
                            messages[index].message,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: defaultStyle.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 14.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '${messages[index].timestamp.hour.toString()} hours ago',
                            style: hintStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
