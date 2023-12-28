import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elux_app/Screens/Add%20Card/add_card_screen.dart';
import 'package:flutter_elux_app/config/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCardContainer extends StatelessWidget {
  const AddCardContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AddCardScreen.routeName);
          },
          child: DottedBorder(
            dashPattern: const [3],
            color: Colors.grey,
            strokeWidth: 0.6,
            borderType: BorderType.RRect,
            radius: Radius.circular(20.r),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.r,
                ),
              ),
              child: SizedBox(
                height: 60.h,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.6,
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 18.sp,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Add Card',
                      style: defaultStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
