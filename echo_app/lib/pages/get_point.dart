import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../config/colors.dart';
import '../widgets/home_widget.dart';

class GetPoint extends StatefulWidget {
  const GetPoint({super.key});

  @override
  State<GetPoint> createState() => _GetPointState();
}

class Mission {
  String name;
  int point;

  Mission(this.name, this.point);
}

class _GetPointState extends State<GetPoint> {
  bool travel = true;

  List<Mission> mission_array = [
    Mission("Using a tumbler", 1),
    Mission("Separation and discharge of garbage", 1),
    Mission("Packing ingredients or food in multiple containers", 2),
    Mission("Driving by electric Car", 2),
    Mission("Consuming Eco-friendly Products", 2),
    Mission("Consuming Recycling or Upcycling products", 2)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: BackgroundColor.background1,
          title: Text("Get a Point", style: TextStyles.h1),
          centerTitle: true,
        ),
        body: travel == true
            ? SingleChildScrollView(
                child: Column(children: [

                  SizedBox(height: 15.h),
                  Text(
                    "The course currently traveling",
                    textAlign: TextAlign.center,
                    style: TextStyles.h1.copyWith(fontSize: 19.sp),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 17.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xff5DCA75).withOpacity(0.65),
                          width: 2.0,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.w),
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xff5DCA75).withOpacity(0.65),
                                  width: 2.0,
                                ),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("2/2",
                                        style: TextStyles.h1
                                            .copyWith(fontSize: 13.sp)),
                                    Text("~",
                                        style: TextStyles.h1
                                            .copyWith(fontSize: 13.sp)),
                                    Text("2/5",
                                        style: TextStyles.h1
                                            .copyWith(fontSize: 13.sp))
                                  ])),
                          Column(
                            children: [
                              RealTimeCourse(array: [
                                "Suncheon Bay National Garden",
                                "Soagdo",
                                "Dalmago-do",
                                "Naejangsan National Park",
                                "Naejangsan National Park"
                              ]),
                              SizedBox(height: 30.h),
                            ],
                          )
                        ],
                      )),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 50.w,
                        ),
                        Expanded(
                          child: Text(
                            "Getting points",
                            textAlign: TextAlign.center,
                            style: TextStyles.h1.copyWith(fontSize: 21.sp),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100.sp)),
                                      contentPadding: EdgeInsets.zero,
                                      content: Container(
                                        width: 360.w,
                                        height: 457.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.sp),
                                          color: Color(0xFF5DCA75)
                                              .withOpacity(0.83),
                                        ),
                                        child: Center(
                                          child: Column(children: [
                                            SizedBox(height: 53.h),
                                            Text(
                                                "Description of point acquisition",
                                                textAlign: TextAlign.center,
                                                style: TextStyles.h1
                                                    .copyWith(fontSize: 20.sp)),
                                            Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 36,
                                                    vertical: 40),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.sp),
                                                  color: Colors.white,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 18.w,
                                                          top: 27.h,
                                                          right: 30.w),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: 15,
                                                              height: 15,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white,
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                          0xff5DCA75)
                                                                      .withOpacity(
                                                                          0.65),
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              "Each point acquisition can only \nbe earned once per trip, not \neach run.",
                                                              style: TextStyles
                                                                  .h1
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            )
                                                          ]),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 18.w,
                                                          top: 27.h,
                                                          right: 30.w),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: 15,
                                                              height: 15,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white,
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                          0xff5DCA75)
                                                                      .withOpacity(
                                                                          0.65),
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              "Points can only be earned up \nto 10 points throughout the \ntravel period.",
                                                              style: TextStyles
                                                                  .h1
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            )
                                                          ]),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 18.w,
                                                          top: 27.h,
                                                          right: 30.w,
                                                          bottom: 29.h),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: 15,
                                                              height: 15,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white,
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                          0xff5DCA75)
                                                                      .withOpacity(
                                                                          0.65),
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              "All items must go through the \nauthentication process to \nobtain points.",
                                                              style: TextStyles
                                                                  .h1
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            )
                                                          ]),
                                                    ),
                                                  ],
                                                )),
                                          ]),
                                        ),
                                      ));
                                },
                              );
                            },
                            icon: Icon(Icons.add_circle_outline)),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 17.w),
                      child: SingleChildScrollView(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xff5DCA75).withOpacity(0.65),
                            width: 2.0,
                          ),
                        ),
                        child: GettingPoints(array: mission_array),
                      ))),
                ]),
              )
            : Container(
                //not traveling
                decoration: BoxDecoration(color: BackgroundColor.background1),
                padding: EdgeInsets.zero,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 14.w, top: 100.h, right: 15.w, bottom: 100.h),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xff5DCA75).withOpacity(0.65),
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.not_interested,
                                    size: 100.sp,
                                  ),
                                  SizedBox(height: 56.h),
                                  Text(
                                    "You are not currently traveling.",
                                    style:
                                        TextStyles.h1.copyWith(fontSize: 26.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 30.h),
                                  Text(
                                    "You can earn points only during your trip.",
                                    style:
                                        TextStyles.h1.copyWith(fontSize: 26.sp),
                                    textAlign: TextAlign.center,
                                  )
                                ]))))));
  }
}
