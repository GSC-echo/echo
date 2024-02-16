import 'package:echo_app/config/colors.dart';
import 'package:echo_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:echo_app/widgets/other_widget.dart';

class PlaceDetail extends StatefulWidget {
  const PlaceDetail({super.key, required this.place});

  final Place place;

  @override
  State<PlaceDetail> createState() => _PlaceDetailState();
}

class _PlaceDetailState extends State<PlaceDetail> {
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
                margin: EdgeInsets.only(top: 39.h),
                height: 195.h,
                width: 282.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.blueGrey,
                ),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: widget.place.image,
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                  margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                    color: BackgroundColor.background1,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(children: [
                    SizedBox(height: 28.h),
                    Text(widget.place.name,
                        textAlign: TextAlign.center,
                        style: TextStyles.h1.copyWith(fontSize: 18.sp)),
                    SizedBox(height: 13.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_border_rounded,
                          size: 15.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          widget.place.star.toString(),
                          style: TextStyles.h1.copyWith(fontSize: 14.sp),
                        )
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 90.w),
                        child: SaveWidget(
                          place: widget.place,
                          isSaved: saved.contains(widget.place),
                          isCustom: false,
                        )),
                    SizedBox(height: 15.h),
                    Container(
                      alignment: Alignment.center,
                      height: 167.h,
                      width: 255.w,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text("Address",
                        textAlign: TextAlign.center,
                        style: TextStyles.h1.copyWith(fontSize: 7.sp))
                  ])),
            ])));
  }
}
