import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class UserDetailsMiniCard extends StatelessWidget {
  const UserDetailsMiniCard({
    Key? key,
    required this.title,
    required this.color,
    required this.amountOfFiles,
    required this.numberOfIncrease,
  }) : super(key: key);

  final Color color;
  final String title, amountOfFiles;
  final int numberOfIncrease;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
              height: 20,
              width: 20,
              child: Container(
                color: color,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 8.sp,
                        ),
                  ),
                  Text(
                    "$numberOfIncrease",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white70,fontSize: 9.sp,),
                  ),
                ],
              ),
            ),
          ),
          Text(amountOfFiles,style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white,fontSize: 9.sp,),)
        ],
      ),
    );
  }
}
