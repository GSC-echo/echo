import 'package:echo_app/pages/course_detail.dart';
import 'package:echo_app/pages/get_point.dart';
import 'package:echo_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:echo_app/pages/place_detail.dart';
import 'package:echo_app/firestore.dart' as fs;

import '../config/colors.dart';

class RealTimePlacesContent extends StatefulWidget {
  final String content;
  final bool isSelected;
  final VoidCallback onTap;
  
  RealTimePlacesContent({
    required this.content,
    required this.isSelected,
    required this.onTap,
  });
  @override
  _RealTimePlacesContentState createState() => _RealTimePlacesContentState();
}

class _RealTimePlacesContentState extends State<RealTimePlacesContent> {
  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.isSelected
              ? TextStyles.echoNavy.withOpacity(0.8)
              : BackgroundColor.mainGreen.withOpacity(0.8),
        ),
        child: Text(
          widget.content,
          textAlign: TextAlign.center,
          style: TextStyles.h1.copyWith(
              fontSize: 11.sp,
              color: widget.isSelected ? Colors.white : TextStyles.echoNavy),
        ),
      ),
    );
  }
}

Widget RealTimePlace({required BuildContext context, required Place place}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: ((context) => PlaceDetail(place: place))),
      );
    },
    child: Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star_border_rounded,
              size: 15.sp,
              color: Colors.white,
            ),
            SizedBox(width: 5.w),
            Text(
              place.star.toString(),
              style:
                  TextStyles.h1.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
          ],
        ),
        Container(
          width: 160.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(place.image??' '),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            width: 160.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                color: TextStyles.echoNavy.withOpacity(0.7)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.name??' ',
                  textAlign: TextAlign.center,
                  style: TextStyles.white1.copyWith(fontSize: 10.sp),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget RealTimeCourse(
    {required BuildContext context,
    required List<Place> array,
    required bool isinMap}) {
  return isinMap
      ? Column(children: [
          SizedBox(height: 25.h),
          Container(
            height: 70.h,
            width: 289.w,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  child: Row(
                    children: List.generate(array.length, (index) {
                      Place place = array[index];
                      return Row(children: [
                        Column(children: [
                          SizedBox(height: 57.h),
                          index == 0
                              ? Container()
                              : Container(
                                  width: 26.6.w,
                                  height: 2.h,
                                  decoration: BoxDecoration(
                                    color: TextStyles.echoNavy.withOpacity(0.8),
                                  ),
                                ),
                        ]),
                        Column(
                          children: [
                            Container(
                              width: 70.w,
                              height: 40.h,
                              child: isinMap
                                  ? GestureDetector(
                                      onTap: () {
                                        print("mark ${place.name ?? ' '} on Map");

                                      },
                                      child: Text(
                                        place.name??' ',
                                        textAlign: TextAlign.center,
                                        style: TextStyles.h1
                                            .copyWith(fontSize: 10.sp),
                                      ),
                                    )
                                  : Text(
                                      place.name?? ' ',
                                      textAlign: TextAlign.center,
                                      style: TextStyles.h1
                                          .copyWith(fontSize: 10.sp),
                                    ),
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              children: [
                                index == 0
                                    ? Container(width: 30.w)
                                    : Container(
                                        width: 35.w,
                                        height: 2.h,
                                        decoration: BoxDecoration(
                                          color: TextStyles.echoNavy
                                              .withOpacity(0.8)
                                              .withOpacity(0.65),
                                        ),
                                      ),
                                Container(
                                  width: 6.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: TextStyles.echoNavy.withOpacity(0.8),
                                  ),
                                ),
                                index == array.length - 1
                                    ? Container(width: 40.w)
                                    : Container(
                                        width: 35.w,
                                        height: 2.h,
                                        decoration: BoxDecoration(
                                            color: TextStyles.echoNavy
                                                .withOpacity(0.8)),
                                      ),
                              ],
                            ),
                          ],
                        )
                      ]);
                    }),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
        ])
      : GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => CourseDetail(array)),
              ),
            );
          },
          child: Column(children: [
            SizedBox(height: 25.h),
            Container(
              height: 70.h,
              width: 289.w,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: List.generate(array.length, (index) {
                        Place place = array[index];
                        return Row(children: [
                          Column(children: [
                            SizedBox(height: 57.h),
                            index == 0
                                ? Container()
                                : Container(
                                    width: 26.6.w,
                                    height: 2.h,
                                    decoration: BoxDecoration(
                                      color:
                                          TextStyles.echoNavy.withOpacity(0.8),
                                    ),
                                  ),
                          ]),
                          Column(
                            children: [
                              Container(
                                width: 70.w,
                                height: 40.h,
                                child: Center(
                                  child: Text(
                                    place.name??' ',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyles.h1.copyWith(fontSize: 10.sp),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.h),
                              Row(
                                children: [
                                  index == 0
                                      ? Container(width: 30.w)
                                      : Container(
                                          width: 35.w,
                                          height: 2.h,
                                          decoration: BoxDecoration(
                                            color: TextStyles.echoNavy
                                                .withOpacity(0.8)
                                                .withOpacity(0.65),
                                          ),
                                        ),
                                  Container(
                                    width: 6.w,
                                    height: 6.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          TextStyles.echoNavy.withOpacity(0.8),
                                    ),
                                  ),
                                  index == array.length - 1
                                      ? Container(width: 40.w)
                                      : Container(
                                          width: 35.w,
                                          height: 2.h,
                                          decoration: BoxDecoration(
                                              color: TextStyles.echoNavy
                                                  .withOpacity(0.8)),
                                        ),
                                ],
                              ),
                            ],
                          )
                        ]);
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
          ]));
}

Widget AboutStageWidget(
    {required List<String> imageUrlList,
    required List<String> stageList,
    required List<String> detailList}) {
  return ListView(
      children: List.generate(stageList.length, (index) {
    return Column(children: [
      Container(
        padding: EdgeInsets.only(left: 25.w, top: 25.h, bottom: 25.h),
        child: Row(
          children: [
            Center(
              child: Image.asset(
                imageUrlList[index],
                width: 86,
                height: 86,
              ),
            ),
            SizedBox(width: 30.w),
            Column(
              children: [
                Center(
                  child: Text(
                    stageList[index],
                    style: TextStyles.h1,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    detailList[index],
                    style: TextStyles.h1.copyWith(fontSize: 15.sp),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.0),
        child: index == stageList.length - 1
            ? Container()
            : Divider(
                color: TextStyles.echoNavy,
                thickness: 2.0,
              ),
      ),
    ]);
  }));
}

class GettingPoints extends StatefulWidget {
  final List<Mission> array;

  GettingPoints({required this.array});

  @override
  _GettingPointsState createState() => _GettingPointsState();
}

class _GettingPointsState extends State<GettingPoints> {
  late List<bool> isCheckedList;

  @override
  void initState() {
    super.initState();
    isCheckedList = List.generate(widget.array.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(widget.array.length, (index) {
        bool isChecked = isCheckedList[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
          child: Container(
            decoration: BoxDecoration(
              color: isChecked
                  ? TextStyles.echoNavy.withOpacity(0.2)
                  : BackgroundColor.mainGreen.withOpacity(0.85),
              borderRadius: BorderRadius.circular(15.sp),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              //gestureDetector 변환 -> onTap() => 카메라, 위치기반 인증
              title: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.array[index].point.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyles.h1.copyWith(
                              fontSize: 10.sp,
                              color: Color(0xFF176B87).withOpacity(0.77),
                            ),
                          ),
                          Text(
                            "points",
                            textAlign: TextAlign.center,
                            style: TextStyles.h1.copyWith(
                              fontSize: 10.sp,
                              color: Color(0xFF176B87).withOpacity(0.77),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 30.w),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.array[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyles.h1.copyWith(fontSize: 15.sp),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.w),
                  // Checkbox(
                  //   value: isChecked,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       isCheckedList[index] = value!;
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
