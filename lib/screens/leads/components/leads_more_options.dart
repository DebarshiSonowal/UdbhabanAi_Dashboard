import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../core/constants/color_constants.dart';
import '../../dashboard/components/charts.dart';
import '../../dashboard/components/user_details_mini_card.dart';

class LeadDetailsWidget extends StatelessWidget {
  const LeadDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Conversion Rate",
            style: TextStyle(
              fontSize: 9.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(minimum: 0, maximum: 100, ranges: <GaugeRange>[
              GaugeRange(startValue: 0, endValue: 33, color: Colors.red),
              GaugeRange(startValue: 33, endValue: 66, color: Colors.orange),
              GaugeRange(startValue: 66, endValue: 100, color: Colors.green)
            ], pointers: <GaugePointer>[
              NeedlePointer(value: 90)
            ], annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Container(
                    child: Text('90.0',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                angle: 90,
                positionFactor: 0.5,
              )
            ])
          ]),
          Text(
            "Lead Source",
            style: TextStyle(
              fontSize: 9.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 2.h),
          Chart(),
          UserDetailsMiniCard(
            color: Color(0xff0293ee),
            title: "Call",
            amountOfFiles: "%28.3",
            numberOfIncrease: 1328,
          ),
          UserDetailsMiniCard(
            color: Color(0xfff8b250),
            title: "Email",
            amountOfFiles: "%16.7",
            numberOfIncrease: 1328,
          ),
          UserDetailsMiniCard(
            color: Color(0xff845bef),
            title: "In Person",
            amountOfFiles: "%22.4",
            numberOfIncrease: 1328,
          ),
          UserDetailsMiniCard(
            color: Color(0xff13d38e),
            title: "Website",
            amountOfFiles: "%2.3",
            numberOfIncrease: 140,
          ),
        ],
      ),
    );
  }
}
