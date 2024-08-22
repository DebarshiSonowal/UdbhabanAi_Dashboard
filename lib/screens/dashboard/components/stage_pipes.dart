import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/color_constants.dart';
import 'mini_information_widget.dart';

class StagePipes extends StatefulWidget {
  @override
  State<StagePipes> createState() => _StagePipesState();
}

class _StagePipesState extends State<StagePipes> {
  List<stage_pipe_model> stage_pipes = [
    // for (var i = 0; i < 4; i++)
    stage_pipe_model(
      class_name: "Propesting",
      color: primaryColor,
      percent: 35,
      amount: Random.secure().nextInt(1000000),
    ),
    stage_pipe_model(
      class_name: "Proposal",
      color: Color(0xff23b6e6),
      percent: 55,
      amount: Random.secure().nextInt(1000000),
    ),
    stage_pipe_model(
      class_name: "Quotation",
      color: Color(0xFFFFA113),
      percent: 75,
      amount: Random.secure().nextInt(1000000),
    ),
    stage_pipe_model(
      class_name: "Negotiation",
      color: Color(0xff02d39a),
      percent: 25,
      amount: Random.secure().nextInt(1000000),
    )
  ];

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
            "Stage Pipes",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 9.sp,
                ),
          ),
          SizedBox(
            height: 4.h,
          ),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final current = stage_pipes[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 45.w,
                      height: 1.5.h,
                      child: ProgressLine(
                        color: current.color!,
                        percentage: current.percent!.toInt(),
                      ),
                    ),
                    Text(
                      "${current.percent}%",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                            fontSize: 7.sp,
                          ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 2.h,
              );
            },
            itemCount: stage_pipes.length,
          ),
          SizedBox(
            height: 2.h,
          ),
         Container(
           padding: EdgeInsets.symmetric(
             horizontal: 2.w,
           ),
            height: 3.h,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final current = stage_pipes[index];
                return SizedBox(
                  child: Row(
                    children: [
                      Container(
                        width: 1.w,
                        height: 1.w,
                        color: current.color,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        "${current.class_name}",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                              fontSize: 7.sp,
                            ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 3.w,
                );
              },
              itemCount: stage_pipes.length,
            ),
          ),
        ],
      ),
    );
  }
}

class stage_pipe_model {
  String? class_name;
  double? percent;
  int? amount;
  Color? color;

  stage_pipe_model({this.class_name, this.percent, this.amount, this.color});
}
