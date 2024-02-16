import 'package:echo_app/config/colors.dart';
import 'package:echo_app/pages/home.dart';
import 'package:echo_app/pages/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:echo_app/widgets/other_widget.dart';

class CreatedCourse extends StatelessWidget {
  const CreatedCourse({
    super.key,
    required this.array,
  });

  final List<Place> array;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Created Course", style: TextStyles.h1),
          centerTitle: true,
        ),
        body: Column(children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              //padding: EdgeInsets.only(bottom:),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.sp),
                color: Color(0xFF5DCA75).withOpacity(0.83),
              ),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 30.w, right: 30.h, top: 40.h, bottom: 20.h),
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: BackgroundColor.background1,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Container(
                    margin:
                        EdgeInsets.only(left: 30.w, right: 30.w, bottom: 40.h),
                    decoration: BoxDecoration(
                      color: BackgroundColor.background1,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                top: 10.h, left: 15.w, right: 200.w),
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
                                      style: TextStyles.h3
                                          .copyWith(fontSize: 17.sp)),
                                  SizedBox(width: 5.w),
                                  Text(
                                    "places",
                                    style:
                                        TextStyles.h1.copyWith(fontSize: 17.sp),
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
                                buildcontext: context,
                                array: array,
                                isCustom: false))
                      ],
                    )),
              ])),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 110.w),
            child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(4),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xffD5F0C1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                onPressed: null,
                child: Row(children: [
                  Icon(Icons.check, color: Colors.black, size: 30.sp),
                  SizedBox(width: 20.w),
                  Text("Confirm with \nthis course",
                      style: TextStyles.h1.copyWith(fontSize: 16.sp),
                      textAlign: TextAlign.center),
                ])),
          )
        ]));
  }
}
