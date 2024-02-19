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
        appBar: AppBar(
          backgroundColor: BackgroundColor.mainGreen,
          centerTitle: true,
          title: Text(
            widget.place.name ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Container(
            margin: EdgeInsets.only(top: 5.h),
            decoration: BoxDecoration(color: BackgroundColor.background1),
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: 30.h),
                height: 195.h,
                width: 320.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.blueGrey,
                ),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(widget.place.image??' '),
                ),
              ),
              SizedBox(height: 20.h),
              Text(widget.place.name??' ',
                  textAlign: TextAlign.center,
                  style: TextStyles.h1.copyWith(fontSize: 22.sp)),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 17.sp,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    widget.place.star.toString(),
                    style: TextStyles.h1.copyWith(fontSize: 17.sp),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 5.h),
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Column(children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 120.w),
                        child: SaveWidget(
                          place: widget.place,
                          isSaved: saved.contains(widget.place),
                          isCustom: false,
                        )),
                    SizedBox(height: 30.h),
                    Container(
                      alignment: Alignment.center,
                      height: 180.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        color: TextStyles.echoYellow,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(widget.place.address??' ',
                        textAlign: TextAlign.center,
                        style: TextStyles.h1.copyWith(fontSize: 10.sp))
                  ])),
            ])));
  }
}
