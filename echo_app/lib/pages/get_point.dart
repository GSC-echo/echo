import 'package:echo_app/pages/home.dart';
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
  List<Place> course1 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BackgroundColor.mainGreen,
        appBar: AppBar(
          backgroundColor: BackgroundColor.mainGreen,
        ),
        body: travel == true
            ? SingleChildScrollView(
                child: Column(children: [
                  Text(
                    "Currently, you are going on...",
                    textAlign: TextAlign.center,
                    style: TextStyles.white1.copyWith(fontSize: 19.sp),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 12.w),
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: TextStyles.echoNavy.withOpacity(0.9),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("2/2",
                                        style: TextStyles.white1
                                            .copyWith(fontSize: 13.sp)),
                                    Text("~",
                                        style: TextStyles.white1
                                            .copyWith(fontSize: 13.sp)),
                                    Text("2/5",
                                        style: TextStyles.white1
                                            .copyWith(fontSize: 13.sp))
                                  ])),
                          Column(
                            children: [
                              RealTimeCourse(
                                  context: context,
                                  array: courses_array[0],
                                  isinMap: false),
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
                            "Missons",
                            textAlign: TextAlign.center,
                            style: TextStyles.white1.copyWith(fontSize: 21.sp),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    backgroundColor:
                                        TextStyles.echoNavy.withOpacity(0.8),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.sp)),
                                    contentPadding: EdgeInsets.zero,
                                    content: Container(
                                      width: 360.w,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.45,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.sp),
                                      ),
                                      child: Center(
                                        child: Column(children: [
                                          SizedBox(height: 30.h),
                                          Text("About Missons & Points",
                                              textAlign: TextAlign.center,
                                              style: TextStyles.white1
                                                  .copyWith(fontSize: 20.sp)),
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 17, vertical: 20),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.sp),
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 20.w,
                                                        top: 20.h,
                                                        right: 40.w),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          5.w),
                                                              child: Text(
                                                                "Each point acquisition can only be\nearned once per travel.",
                                                                style: TextStyles
                                                                    .white1
                                                                    .copyWith(
                                                                        fontSize:
                                                                            12.sp),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              )),
                                                        ]),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 20.w,
                                                        top: 27.h,
                                                        right: 20.w),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          5.w),
                                                              child: Text(
                                                                "Points can only be earned up to \n10 points throughout the travel period.",
                                                                style: TextStyles
                                                                    .white1
                                                                    .copyWith(
                                                                        fontSize:
                                                                            12.sp),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ))
                                                        ]),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                      left: 20.w,
                                                      top: 27.h,
                                                      right: 20.w,
                                                    ),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          5.w),
                                                              child: Text(
                                                                "All items must go through the\nauthentication process\nin order to obtain points.",
                                                                style: TextStyles
                                                                    .white1
                                                                    .copyWith(
                                                                        fontSize:
                                                                            12.sp),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ))
                                                        ]),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 20.w,
                                                        top: 27.h,
                                                        right: 20.w,
                                                        bottom: 29.h),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          5.w),
                                                              child: Text(
                                                                "Points collected during the travel\nperiod will be added after the it ends.",
                                                                style: TextStyles
                                                                    .white1
                                                                    .copyWith(
                                                                        fontSize:
                                                                            12.sp),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ))
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
                          icon: Icon(Icons.info_outlined),
                          color: BackgroundColor.background1,
                        ),
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
