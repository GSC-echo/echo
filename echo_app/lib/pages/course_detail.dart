import 'package:echo_app/config/colors.dart';
import 'package:echo_app/pages/home.dart';
import 'package:echo_app/pages/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:echo_app/widgets/other_widget.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail(this.place_list, this.review_list, {super.key});

  final List<Place> place_list;
  final List<Review> review_list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BackgroundColor.mainGreen,
        centerTitle: true,
        title: Text(
          "Course Detail",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF5DCA75),
        ),
        child: Column(children: [
          Container(
              // height: 300.h,
              // width: 200.w,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 80.sp),
                      alignment: Alignment.center,
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
                            Text(place_list.length.toString(),
                                style: TextStyles.h3.copyWith(fontSize: 15.sp)),
                            SizedBox(width: 5.w),
                            Text(
                              "places",
                              style: TextStyles.h1.copyWith(fontSize: 15.sp),
                            )
                          ])),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 13.h),
                      height: 300.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        color: Colors.white,
                      ),
                      child: CourseDetailWidget(
                          buildcontext: context,
                          array: place_list,
                          isCustom: false))
                ],
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 13.h),
              height: MediaQuery.of(context).size.height * 0.3,
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
                          Icon(
                            Icons.reviews,
                            size: 17,
                          ),
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
                      ),
                    ],
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.22,
                      margin: EdgeInsets.all(10.sp),
                      child: ReviewShortWidget(array: review_list))
                ],
              )), //review
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  ),
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
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                onPressed: null,
                child: Row(children: [
                  Icon(
                    Icons.bookmark_border_rounded,
                    size: 25.sp,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text("Save\nthis course",
                      style: TextStyles.h1.copyWith(fontSize: 12.sp),
                      textAlign: TextAlign.center)
                ])),
            ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  ),
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
                  Icon(
                    Icons.check,
                    size: 25.sp,
                    color: Colors.black,
                  ),
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
