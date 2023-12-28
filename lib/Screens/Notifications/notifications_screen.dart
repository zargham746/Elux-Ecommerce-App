import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Widgets/custom_icon_button.dart';
import 'package:flutter_elux_app/config/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Models/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = '/notification';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const NotificationScreen(),
    );
  }

  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationModel> notifications = [
      NotificationModel(
        userImage: 'assets/images/person1.jpg',
        userName: 'Kiristine Jones',
        userMessage:
            'It is a long established fact that the reader will be distracted by the readable content of the page.',
        postedTime: DateTime.now(),
      ),
      NotificationModel(
        userImage: 'assets/images/person2.jpg',
        userName: 'John Smith',
        userMessage:
            'There are many variations of passages of Lorem Ipsum available.',
        postedTime: DateTime.now(),
      ),
      NotificationModel(
        userImage: 'assets/images/person1.jpg',
        userName: 'Kiristine Jones',
        userMessage:
            'It is a long established fact that the reader will be distracted by the readable content of the page.',
        postedTime: DateTime.now(),
      ),
      NotificationModel(
        userImage: 'assets/images/person3.jpg',
        userName: 'Albert Jones',
        userMessage:
            'If you\'re using a passage of Lorem Ipsum, you need to be sure that there is\'nt embarrasing.',
        postedTime: DateTime.now(),
      ),
      NotificationModel(
        userImage: 'assets/images/person2.jpg',
        userName: 'John Smith',
        userMessage:
            'It is a long established fact that the reader will be distracted by the readable content of the page.',
        postedTime: DateTime.now(),
      ),
      NotificationModel(
        userImage: 'assets/images/person1.jpg',
        userName: 'Kiristine Jones',
        userMessage:
            'It is a long established fact that the reader will be distracted by the readable content of the page.',
        postedTime: DateTime.now(),
      ),
      NotificationModel(
        userImage: 'assets/images/person2.jpg',
        userName: 'John Smith',
        userMessage:
            'There are many variations of passages of Lorem Ipsum available.',
        postedTime: DateTime.now(),
      ),
      NotificationModel(
        userImage: 'assets/images/person3.jpg',
        userName: 'albert Jones',
        userMessage:
            'It is a long established fact that the reader will be distracted by the readable content of the page.',
        postedTime: DateTime.now(),
      ),
      NotificationModel(
        userImage: 'assets/images/person2.jpg',
        userName: 'john Smith',
        userMessage:
            'It is a long established fact that the reader will be distracted by the readable content of the page.',
        postedTime: DateTime.now(),
      ),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notifications',
                  style: defaultStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                  ),
                ),
                CustomIconButton(
                  icon: Icons.more_vert_outlined,
                  onpress: () {},
                ),
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                scrollDirection: Axis.vertical,
                itemCount: notifications.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(3.w),
                    child: Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey[300],
                          backgroundImage:
                              AssetImage(notifications[index].userImage),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notifications[index].userName,
                                style: defaultStyle.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                notifications[index].userMessage,
                                style: defaultStyle.copyWith(fontSize: 12.sp),
                                maxLines: 4,
                                overflow: TextOverflow.visible,
                              ),
                              Text(
                                '${notifications[index].postedTime.hour.toString()} hours ago',
                                style: defaultStyle.copyWith(
                                    color: Colors.grey, fontSize: 12.sp),
                              ),
                              const Divider(
                                thickness: 0.8,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
