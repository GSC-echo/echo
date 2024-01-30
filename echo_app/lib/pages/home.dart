import 'package:echo_app/pages/about_stage.dart';
import 'package:echo_app/widgets/home_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'about_stage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedContent = "Entire";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: BackgroundColor.background1,
          title: Text("HOME", style: TextStyles.h1),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: BackgroundColor.background1,
            ),
            child: SafeArea(
              child: Column(
                children: [
                  // Padding(padding: EdgeInsets.only(top: 15.h)),
                  // Text(
                  //   "HOME",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyles.h1,
                  // ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 12.h, left: 20.w, right: 20.w),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: BackgroundColor.mainGreen.withOpacity(0.65),
                      ),
                      height: 207.h,
                      child: Column(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                //icon
                                Container(
                                    child: Image.asset(
                                      'lib/config/images/sprout.png', //user.stageImage
                                      width: 86,
                                      height: 86,
                                    ),
                                    padding: EdgeInsets.only(top: 13.h)),
                                SizedBox(height: 8.h),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Sprout", //user.stage
                                          textAlign: TextAlign.center,
                                          style: TextStyles.h3),
                                      Text(
                                        textAlign: TextAlign.center,
                                        " stage",
                                        style: TextStyles.h2,
                                      ),
                                    ]),
                                Container(
                                    padding: EdgeInsets.only(
                                        top: 10.h, left: 34.w, right: 34.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          Text("24", //user.point
                                              textAlign: TextAlign.left,
                                              style: TextStyles.h3),
                                          Text(
                                            " points",
                                            textAlign: TextAlign.left,
                                            style: TextStyles.h2,
                                          ),
                                        ]),
                                        Row(children: [
                                          Text("11", //max-user.point
                                              textAlign: TextAlign.right,
                                              style: TextStyles.h3
                                                  .copyWith(fontSize: 12.sp)),
                                          Text(
                                            " until",
                                            textAlign: TextAlign.right,
                                            style: TextStyles.h2
                                                .copyWith(fontSize: 12.sp),
                                          ),
                                          Text(" Seedling", //user.nextStage
                                              textAlign: TextAlign.right,
                                              style: TextStyles.h3
                                                  .copyWith(fontSize: 12.sp)),
                                          Text(
                                            " stage",
                                            textAlign: TextAlign.right,
                                            style: TextStyles.h2
                                                .copyWith(fontSize: 12.sp),
                                          ),
                                        ])
                                      ],
                                    )),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 34, right: 34, top: 5),
                                  child: ClipRRect(
                                      child: LinearPercentIndicator(
                                    percent: 0.30, //percent(100*user.point/max)
                                    lineHeight: 13,
                                    backgroundColor: Colors.white,
                                    progressColor: Color(0xFF2DB400),
                                    barRadius: Radius.circular(35),
                                  )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Row(
                      children: [
                        //Get a Point
                        Padding(
                            padding: EdgeInsets.only(left: 28.w),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color(0xff5DCA75).withOpacity(0.65),
                                    width: 2.0,
                                  ),
                                ),
                                height: 92.h,
                                width: 160.w,
                                child: GestureDetector(
                                  onTap: () {
                                    print("Get a Point");
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.stars_outlined,
                                        size: 40,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 8.w),
                                      Text('Get a Point',
                                          textAlign: TextAlign.center,
                                          style: TextStyles.h1
                                              .copyWith(fontSize: 18.sp)),
                                    ],
                                  ),
                                ))),
                        //About Stage
                        Padding(
                            padding: EdgeInsets.only(left: 14.w),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color(0xff5DCA75).withOpacity(0.65),
                                    width: 2.0,
                                  ),
                                ),
                                height: 92.h,
                                width: 160.w,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                const AboutStage())));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.stairs,
                                        size: 40,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        'About Stage',
                                        textAlign: TextAlign.center,
                                        style: TextStyles.h1
                                            .copyWith(fontSize: 18.sp),
                                      ),
                                    ],
                                  ),
                                )))
                      ],
                    ),
                  ),
                  SizedBox(height: 34.h),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 30.w),
                    child: Text(
                      "Popular Real-time Places",
                      style: TextStyles.h1,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      SizedBox(width: 17.w),
                      RealTimePlacesContent(
                        content: "Entire",
                        isSelected: selectedContent == "Entire",
                        onTap: () {
                          _handleTap("Entire");
                        },
                      ),
                      SizedBox(width: 8.w),
                      RealTimePlacesContent(
                        content: "Accomodation",
                        isSelected: selectedContent == "Accomodation",
                        onTap: () {
                          _handleTap("Accomodation");
                        },
                      ),
                      SizedBox(width: 8.w),
                      RealTimePlacesContent(
                        content: "Restaurant",
                        isSelected: selectedContent == "Restaurant",
                        onTap: () {
                          _handleTap("Restaurant");
                        },
                      ),
                      SizedBox(width: 8.w),
                      RealTimePlacesContent(
                        content: "Tourist Attraction",
                        isSelected: selectedContent == "Tourist Attraction",
                        onTap: () {
                          _handleTap("Tourist Attraction");
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  SingleChildScrollView(
                    padding: EdgeInsets.only(left: 11.w),
                    scrollDirection: Axis.horizontal,
                    child:
                        RealTimePlace(content: "Entire"), //해당되는 content의 상위 5가지
                  ),
                  SizedBox(height: 34.h),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 30.w),
                    child: Text(
                      "Popular Real-time Courses",
                      style: TextStyles.h1,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 14.w, top: 7.h, right: 15.w, bottom: 22.h),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xff5DCA75).withOpacity(0.65),
                            width: 2.0,
                          ),
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Container(
                              height: 106.h,
                              child: Row(
                                children: [
                                  Container(
                                      height: 20.h,
                                      width: 20.w,
                                      margin: EdgeInsets.only(
                                          left: 29, top: 41.h, bottom: 41.h),
                                      decoration: BoxDecoration(
                                          color: Color(0xff5DCA86),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text("1",
                                            textAlign: TextAlign.center,
                                            style: TextStyles.h1.copyWith(
                                                fontSize: 15.sp,
                                                color: Colors.white)),
                                      )),
                                  SizedBox(width: 20.w),
                                  RealTimeCourse(array: [
                                    "Naejangsan National Park",
                                    "Naejangsan National Park",
                                    "Naejangsan National Park",
                                    "Naejangsan National Park",
                                    "Naejangsan National Park"
                                  ])
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 23.0),
                              child: Divider(
                                color: Color(0xff5DCA75).withOpacity(0.65),
                                thickness: 2.0,
                              ),
                            ),
                            Container(
                              height: 106.h,
                              child: Row(
                                children: [
                                  Container(
                                      height: 20.h,
                                      width: 20.w,
                                      margin: EdgeInsets.only(
                                          left: 29, top: 41.h, bottom: 41.h),
                                      decoration: BoxDecoration(
                                          color: Color(0xff5DCA86),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text("2",
                                            textAlign: TextAlign.center,
                                            style: TextStyles.h1.copyWith(
                                                fontSize: 15.sp,
                                                color: Colors.white)),
                                      )),
                                  SizedBox(width: 20.w),
                                  RealTimeCourse(array: [
                                    "Naejangsan National Park",
                                    "Naejangsan National Park",
                                    "Naejangsan National Park",
                                    "Naejangsan National Park",
                                    "Naejangsan National Park"
                                  ])
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 23.0),
                              child: Divider(
                                color: Color(0xff5DCA75).withOpacity(0.65),
                                thickness: 2.0,
                              ),
                            ),
                            Container(
                              height: 106.h,
                              child: Row(
                                children: [
                                  Container(
                                      height: 20.h,
                                      width: 20.w,
                                      margin: EdgeInsets.only(
                                          left: 29, top: 41.h, bottom: 41.h),
                                      decoration: BoxDecoration(
                                          color: Color(0xff5DCA86),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text("3",
                                            textAlign: TextAlign.center,
                                            style: TextStyles.h1.copyWith(
                                                fontSize: 15.sp,
                                                color: Colors.white)),
                                      )),
                                  SizedBox(width: 20.w),
                                  RealTimeCourse(array: [
                                    "item3",
                                    "item3",
                                    "item3",
                                    "item3",
                                    "item3"
                                  ])
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ));
  }

  void _handleTap(String content) {
    setState(() {
      selectedContent = content;
    });
  }
}
