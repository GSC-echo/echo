import 'dart:async';

import 'package:echo_app/config/colors.dart';
import 'package:echo_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:echo_app/widgets/other_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
                        child: Container(
                            width: 200,
                            height: 40, // 원하는 가로 크기로 조절
                            child: SaveWidget(
                              place: widget.place,
                              isSaved: saved.contains(widget.place),
                              isCustom: false,
                            ),
                          ),),
                    SizedBox(height: 30.h),
                    Container(
                      alignment: Alignment.center,
                      height: 240.h,
                      width: 320.w,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                          color: Color(0xff5DCA75).withOpacity(0.65),
                          width: 3.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(35.sp),
                        child: MapDetail(place: widget.place,),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      widget.place.address ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyles.h1.copyWith(fontSize: 10.sp))
                  ])),
            ])));
  }
}

class MapDetail extends StatefulWidget {
  final Place place;

  MapDetail({required this.place});

  @override
  _MapDetailState createState() => _MapDetailState();
}

class _MapDetailState extends State<MapDetail> {
  Completer<GoogleMapController> _controller = Completer();

  late CameraPosition _currentPosition;

  @override
  void initState() {
    super.initState();
    _currentPosition = CameraPosition(
      target: LatLng(
        widget.place.geoPoint?.latitude ?? 36.8,
        widget.place.geoPoint?.longitude ?? 127.9,
      ),
      zoom: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: GoogleMap(
          initialCameraPosition: _currentPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete();
          },
          markers: {
            Marker(
              markerId: const MarkerId('m1'),
              position: LatLng(
                widget.place.geoPoint!.latitude,
                widget.place.geoPoint!.longitude,
              ),
            ),
          },
        ),
      ),
    );
  }
}