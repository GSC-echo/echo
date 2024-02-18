import 'package:echo_app/config/colors.dart';
import 'package:echo_app/pages/created_course.dart';
import 'package:echo_app/pages/home.dart';
import 'package:echo_app/pages/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:echo_app/widgets/other_widget.dart';

class CustomCourse extends StatelessWidget {
  const CustomCourse({
    super.key,
    required this.array,
  });

  final List<Place> array;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customization", style: TextStyles.h1),
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
            child: Container(
                margin: EdgeInsets.all(30.h),
                //height: MediaQuery.of(context).size.height * 0.45,
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
                                  style:
                                      TextStyles.h3.copyWith(fontSize: 17.sp)),
                              SizedBox(width: 5.w),
                              Text(
                                "places",
                                style: TextStyles.h1.copyWith(fontSize: 17.sp),
                              )
                            ])),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.65,
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
                            isCustom: true))
                  ],
                ))),
        ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(
                  color: Color(0xff5DCA86),
                  width: 4.0,
                ),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // 원하는 모양으로 설정
                ),
              ),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(70.sp)),
                        contentPadding: EdgeInsets.zero,
                        content: Container(
                            width: 360.w,
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70.sp),
                              border: Border.all(
                                  color: Color(0xFF5DCA75).withOpacity(0.83),
                                  width: 2.0.sp),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: Column(children: [
                              SizedBox(height: 40.h),
                              Icon(
                                Icons.notifications_none,
                                size: 50.sp,
                              ),
                              SizedBox(height: 45.h),
                              Text(
                                "There is a recommended course \nwith the same configuration.",
                                style: TextStyles.h1.copyWith(fontSize: 20.sp),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30.h),
                              Text(
                                  "Do you want to check the \nrecommended course?",
                                  style:
                                      TextStyles.h1.copyWith(fontSize: 20.sp),
                                  textAlign: TextAlign.center),
                              SizedBox(height: 50.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      elevation:
                                          MaterialStateProperty.all<double>(4),
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                        EdgeInsets.symmetric(
                                            vertical: 15.h, horizontal: 10.w),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xffD5F0C1)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              15.0), // 원하는 모양으로 설정
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  CreatedCourse(
                                                      array: custom_list))));
                                    },
                                    child: Text(
                                        "No. Continue with \ncustom result",
                                        style: TextStyles.h1
                                            .copyWith(fontSize: 14.sp),
                                        textAlign: TextAlign.center),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      elevation:
                                          MaterialStateProperty.all<double>(4),
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                        EdgeInsets.symmetric(
                                            vertical: 15.h, horizontal: 10.w),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xff5DCA86)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              15.0), // 원하는 모양으로 설정
                                        ),
                                      ),
                                    ),
                                    onPressed: null,
                                    child: Text(
                                        "Yes. Check the \nrecommended course",
                                        style: TextStyles.h1
                                            .copyWith(fontSize: 14.sp),
                                        textAlign: TextAlign.center),
                                  )
                                ],
                              )
                            ]))));
                  });
            },
            child: Text(
              "Create a Course",
              style: TextStyles.green.copyWith(fontSize: 16.sp),
              textAlign: TextAlign.center,
            )),
      ]),
    );
  }
}
