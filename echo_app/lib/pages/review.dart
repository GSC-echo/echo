import 'package:echo_app/config/colors.dart';
import 'package:echo_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:echo_app/widgets/other_widget.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage(this.array, {super.key});

  final List<Review> array;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("REVIEW", style: TextStyles.h1),
        centerTitle: true,
      ),
      body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100.sp),
              border: Border.all(color: Color(0xFF5DCA75), width: 3.0.sp)),
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 33.w),
              child: ReviewDetailWidget(array: array))),
    );
  }
}
