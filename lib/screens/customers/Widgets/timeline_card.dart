import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TimelineCard extends StatelessWidget {
  const TimelineCard({
    Key? key,
    required this.index,
    required this.list,
  }) : super(key: key);
  final int index;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      margin: index % 2 == 0
          ? EdgeInsets.only(
              left: 1.w,
            )
          : EdgeInsets.only(
              right: 1.w,
            ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: index%2==0?Colors.green:Colors.red,
          width: 0.1.w,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 1.w,
        vertical: 0.2.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            list[index],
            style: TextStyle(
              color: Colors.white,
              fontSize: 8.sp,
            ),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 7.w,
                child: Text(
                  '- By ${Faker.instance.name.fullName()}',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 6.sp,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(
            '${DateFormat("dd/MM/yyyy HH:mm a").format(DateTime.now().add(Duration(days: index)))}',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 5.5.sp,
            ),
          ),
        ],
      ),
    );
  }
}
