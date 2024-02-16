import 'package:echo_app/config/colors.dart';
import 'package:echo_app/pages/home.dart';
import 'package:echo_app/pages/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:echo_app/widgets/other_widget.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail(this.array, {super.key});

  final List<Place> array;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.sp),
          color: Color(0xFF5DCA75).withOpacity(0.83),
        ),
        child: Column(children: [
          Container(
              margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
              // height: 300.h,
              // width: 200.w,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                color: BackgroundColor.background1,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                children: [
                  Container(
                      margin:
                          EdgeInsets.only(top: 10.h, left: 15.w, right: 200.w),
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xff5DCA75).withOpacity(0.65),
                          width: 3.0.sp,
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(array.length.toString(),
                                style: TextStyles.h3.copyWith(fontSize: 17.sp)),
                            SizedBox(width: 5.w),
                            Text(
                              "places",
                              style: TextStyles.h1.copyWith(fontSize: 17.sp),
                            )
                          ])),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      margin: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xff5DCA75).withOpacity(0.65),
                          width: 2.0,
                        ),
                      ),
                      child: CourseDetailWidget(
                          buildcontext: context, array: array, isCustom: false))
                ],
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 13.h),
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: BackgroundColor.background1,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          Icon(Icons.reviews),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text("Review",
                              style: TextStyles.h1.copyWith(fontSize: 17.sp)),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            ReviewPage(review_list))));
                              },
                              child: Text("more",
                                  style: TextStyles.h1.copyWith(
                                      color: Color(0x000000).withOpacity(0.35),
                                      fontSize: 12.sp))),
                          SizedBox(width: 20.w)
                        ],
                      )
                    ],
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      margin: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xff5DCA75).withOpacity(0.65),
                          width: 2.0,
                        ),
                      ),
                      child: ReviewShortWidget(array: review_list))
                ],
              )), //review
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xff5DCA86)),
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // 원하는 모양으로 설정
                    ),
                  ),
                ),
                onPressed: null,
                child: Row(children: [
                  Icon(Icons.menu_book, size: 15.sp),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text("Save\nthis course",
                      style: TextStyles.h1.copyWith(fontSize: 12.sp),
                      textAlign: TextAlign.center)
                ])),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xffD5F0C1)),
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // 원하는 모양으로 설정
                    ),
                  ),
                ),
                onPressed: null,
                child: Row(children: [
                  Icon(Icons.menu_book, size: 15.sp),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Confirm with\nthis course",
                    style: TextStyles.h1.copyWith(fontSize: 12.sp),
                    textAlign: TextAlign.center,
                  )
                ])),
          ])
        ]),
      ),
    );
  }
}
