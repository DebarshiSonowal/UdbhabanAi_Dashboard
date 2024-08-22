import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/models/daily_info_model.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MiniInformationWidget extends StatefulWidget {
  const MiniInformationWidget({
    Key? key,
    required this.dailyData,
  }) : super(key: key);
  final DailyInfoModel dailyData;

  @override
  _MiniInformationWidgetState createState() => _MiniInformationWidgetState();
}

int _value = 1;

class _MiniInformationWidgetState extends State<MiniInformationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(defaultPadding * 0.75),
                  // height: 14.sp,
                  // width: 40,
                  decoration: BoxDecoration(
                    color: widget.dailyData.color!.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Icon(
                    widget.dailyData.icon,
                    color: widget.dailyData.color,
                    size: 12.sp,
                  ),
                ),
                DropdownButton(
                  icon: Icon(Icons.more_vert, size: 12.sp),
                  underline: SizedBox(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 8.sp,
                      ),
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("Daily"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Weekly"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Monthly"),
                      value: 3,
                    ),
                  ],
                  onChanged: (int? value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 7.w,
                  child: Text(
                    widget.dailyData.title!,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 7.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // SizedBox(
                //   height: 1.h,
                // ),
                Container(
                  width: 6.w,
                  child: LineChartWidget(
                    colors: widget.dailyData.colors,
                    spotsData: widget.dailyData.spots,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            ProgressLine(
              color: widget.dailyData.color!,
              percentage: widget.dailyData.percentage!,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.dailyData.volumeData}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white70,
                        fontSize: 8.sp,
                      ),
                ),
                Text(
                  widget.dailyData.totalStorage!,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white,fontSize: 8.sp,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    Key? key,
    required this.colors,
    required this.spotsData,
  }) : super(key: key);
  final List<Color>? colors;
  final List<FlSpot>? spotsData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2.5.w,
      height: 30,
      child: LineChart(
        LineChartData(
            lineBarsData: [
              LineChartBarData(
                  spots: spotsData!,
                  belowBarData: BarAreaData(show: false),
                  aboveBarData: BarAreaData(show: false),
                  isCurved: true,
                  dotData: FlDotData(show: false),
                  // colors: colors,
                  barWidth: 3),
            ],
            lineTouchData: LineTouchData(enabled: false),
            titlesData: FlTitlesData(show: false),
            // axisTitleData: FlAxisTitleData(show: false),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false)),
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color color;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
