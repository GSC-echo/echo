import 'package:echo_app/pages/get_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.isSelected
              ? Color(0xff5DCA86).withOpacity(0.83)
              : Colors.white,
          border: Border.all(
            color: Color(0xff5DCA75).withOpacity(0.65),
            width: 2.0,
          ),
        ),
        child: Text(
          widget.content,
          textAlign: TextAlign.center,
          style: TextStyles.h1.copyWith(fontSize: 11.sp),
        ),
      ),
    );
  }
}

Widget RealTimePlace({required content}) {
  //content -> array[places]로 수정 필요
  return Row(children: <Widget>[
    Container(
      margin: EdgeInsets.only(right: 8.w),
      width: 207,
      height: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.red,
      ),
      child: GestureDetector(
        onTap: () {
          print(content + " touched");
        },
      ),
    ),
    Container(
      child: GestureDetector(
        onTap: () {
          print("touched");
        },
      ),
      margin: EdgeInsets.only(right: 8.w),
      width: 207,
      height: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.blue,
      ),
    ),
    Container(
      child: GestureDetector(
        onTap: () {
          print("touched");
        },
      ),
      margin: EdgeInsets.only(right: 8.w),
      width: 207,
      height: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.green,
      ),
    ),
    Container(
      child: GestureDetector(
        onTap: () {
          print("touched");
        },
      ),
      margin: EdgeInsets.only(right: 8.w),
      width: 207,
      height: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.purple,
      ),
    ),
    Container(
      child: GestureDetector(
        onTap: () {
          print("touched");
        },
      ),
      margin: EdgeInsets.only(right: 8.w),
      width: 207,
      height: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.grey,
      ),
    )
  ]);
}

Widget RealTimeCourse({required array}) {
  return Column(children: [
    SizedBox(height: 35.h),
    Container(
      height: 54.h,
      width: 289.w,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 500.w,
            child: Row(
              children: List.generate(array.length, (index) {
                return Row(children: [
                  Column(children: [
                    SizedBox(height: 49.h),
                    index == 0
                        ? Container()
                        : Container(
                            width: 26.6.w,
                            height: 2.h,
                            decoration: BoxDecoration(
                              color: const Color(0xff5DCA75).withOpacity(0.65),
                            ),
                          ),
                  ]),
                  Column(
                    children: [
                      Container(
                        width: 70.w,
                        height: 32.h,
                        // margin: index == array.length - 1
                        //     ? EdgeInsets.only(right: 0.w)
                        //     : EdgeInsets.only(right: 3.w),
                        child: Text(
                          array[index],
                          textAlign: TextAlign.center,
                          style: TextStyles.h1.copyWith(fontSize: 11.sp),
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
                                    color: const Color(0xff5DCA75)
                                        .withOpacity(0.65),
                                  ),
                                ),
                          Container(
                            width: 6.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xff5DCA75).withOpacity(0.65),
                            ),
                          ),
                          index == array.length - 1
                              ? Container(width: 40.w)
                              : Container(
                                  width: 35.w,
                                  height: 2.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff5DCA75)
                                        .withOpacity(0.65),
                                  ),
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
  ]);
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
                color: Color(0xff5DCA75).withOpacity(0.65),
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
                  ? Color(0x000000).withOpacity(0.2)
                  : Color(0xff5DCA75).withOpacity(0.65),
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
