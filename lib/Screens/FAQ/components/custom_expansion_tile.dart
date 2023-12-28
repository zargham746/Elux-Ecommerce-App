import 'package:flutter/material.dart';
import 'package:flutter_elux_app/config/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final String description;
  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  var isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: ExpansionTile(
        iconColor: Colors.black,
        collapsedIconColor: Colors.black,
        tilePadding: EdgeInsets.symmetric(horizontal: 20.w),
        childrenPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        trailing: isExpanded ? const Icon(Icons.remove) : const Icon(Icons.add),
        onExpansionChanged: (bool expanded) {
          setState(() => isExpanded = expanded);
        },
        collapsedShape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        initiallyExpanded: false,
        title: Text(
          widget.title,
          style: defaultStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
        children: [
          Text(
            widget.description,
          ),
        ],
      ),
    );
  }
}
