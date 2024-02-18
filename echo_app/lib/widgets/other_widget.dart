import 'package:echo_app/config/colors.dart';
import 'package:echo_app/pages/course_detail.dart';
import 'package:echo_app/pages/custom_course.dart';
import 'package:echo_app/pages/home.dart';
import 'package:echo_app/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:echo_app/pages/place_detail.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<Place> saved = [];
List<Place> custom_list = [];

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String selectedContent = "Recommended Courses";

  List<String> items = [
    "Suncheon Bay National Garden",
    "Soagdo",
    "Dalmago-do",
    'Suncheon',
    "Soagdo",
    "Dalmago-do",
    'Suncheon',
    "Naejangsan National Park",
    "Naejangsan National Park",
    "Naejangsan National Park",
  ];
  String searchText = '';

  double _containerHeight = 680.0.h;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      if (!_focusNode.hasFocus) {
        _containerHeight = 680.h;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _containerHeight,
              margin: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 35.w, bottom: 5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.sp),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.sp),
                      border: Border.all(
                        color: Color(0xff5DCA75).withOpacity(0.65),
                        width: 3.0,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35.sp),
                      child: GoogleMapWidget(),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Where are you going to travel?',
                            hintStyle: TextStyles.h1.copyWith(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.4)),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 50.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff5DCA86),
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          focusNode: _focusNode,
                          onTap: () {
                            setState(() {
                              _containerHeight = 420.0.h;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              searchText = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        // 이 부분에 Stack으로 구글맵 넣기 -> 구글맵 위에 이 Expanded(장소 리스트)가 나오도록
                        child: searchText.isEmpty
                            ? SizedBox.shrink()
                            : Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 40.0.w),
                                    child: ListView.builder(
                                      itemCount: items.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        if (items[index].toLowerCase().contains(
                                            searchText.toLowerCase())) {
                                          return Card(
                                            elevation: 3,
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Color(0xff5DCA75)
                                                      .withOpacity(0.65),
                                                  width: 1),
                                              borderRadius: BorderRadius.all(
                                                Radius.elliptical(20, 20),
                                              ),
                                            ),
                                            child: SizedBox(
                                              child: ListTile(
                                                contentPadding: EdgeInsets.zero,
                                                title: Text(
                                                  items[index],
                                                  style: TextStyles.h1.copyWith(
                                                      fontSize: 13.sp),
                                                  textAlign: TextAlign.center,
                                                ),
                                                onTap: () => cardClickEvent(
                                                    context, index),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return SizedBox.shrink();
                                        }
                                      },
                                    ),
                                  ),
                                ], //Stack children
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GeneralSavedButton(
                    text: "General", array: courses_array, isGeneral: true),
                GeneralSavedButton(
                    text: "Saved", array: courses_array, isGeneral: false)
              ],
            )
          ],
        ));
  }

  Widget GeneralSavedButton(
      {required text,
      required List<List<Place>> array,
      required bool isGeneral}) {
    GlobalKey<_FixedCustomWidgetState> _fixedCustomWidgetKey = GlobalKey();
    return ElevatedButton(
      onPressed: () async {
        setState(() {
          _containerHeight = 440.0.h;
        });
        FocusScope.of(context).unfocus();

        await showModalBottomSheet(
          backgroundColor: Colors.white,
          barrierColor: Colors.transparent,
          enableDrag: true,
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter bottomState) {
              return Stack(children: [
                Container(
                  height: 300.h, // 원하는 높이로 설정

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10.h),
                      Container(
                          width: 360.w,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: [
                                SizedBox(width: 17.w),
                                RealTimePlacesContent(
                                  content: "Recommended Courses",
                                  isSelected:
                                      selectedContent == "Recommended Courses",
                                  onTap: () {
                                    bottomState(() {
                                      _handleTap("Recommended Courses");
                                    });
                                  },
                                ),
                                SizedBox(width: 8.w),
                                RealTimePlacesContent(
                                  content: "Accomodation",
                                  isSelected: selectedContent == "Accomodation",
                                  onTap: () {
                                    bottomState(() {
                                      _handleTap("Accomodation");
                                    });
                                  },
                                ),
                                SizedBox(width: 8.w),
                                RealTimePlacesContent(
                                  content: "Restaurant",
                                  isSelected: selectedContent == "Restaurant",
                                  onTap: () {
                                    bottomState(() {
                                      _handleTap("Restaurant");
                                    });
                                  },
                                ),
                                SizedBox(width: 8.w),
                                RealTimePlacesContent(
                                  content: "Tourist Attraction",
                                  isSelected:
                                      selectedContent == "Tourist Attraction",
                                  onTap: () {
                                    bottomState(() {
                                      _handleTap("Tourist Attraction");
                                    });
                                  },
                                ),
                              ]))),
                      SizedBox(height: 5.h),
                      Expanded(
                          child: selectedContent == "Recommended Courses"
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: array.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 17.w, vertical: 17.h),
                                      padding: EdgeInsets.only(left: 20.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Color(0xff5DCA75)
                                              .withOpacity(0.65),
                                          width: 3.0.sp,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 260.w,
                                            child: RealTimeCourse(
                                                context: context,
                                                array: array[index],
                                                isinMap:
                                                    true), //RecommendedCourses일때
                                          ),
                                          Container(
                                            color: Color(0xff5DCA75)
                                                .withOpacity(0.65),
                                            width: 3.sp,
                                            height: 100.h,
                                          ),
                                          SizedBox(width: 8.w),
                                          Center(
                                            child: Column(
                                              children: [
                                                Container(
                                                    padding:
                                                        EdgeInsets.all(5.sp),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            //horizontal: 10.w,
                                                            vertical: 5.h),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: Colors.white,
                                                      border: Border.all(
                                                        color: Color(0xff5DCA75)
                                                            .withOpacity(0.65),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            array[index]
                                                                .length
                                                                .toString(),
                                                            style: TextStyles.h3.copyWith(
                                                                color: Color(
                                                                        0xff5DCA75)
                                                                    .withOpacity(
                                                                        0.65),
                                                                fontSize:
                                                                    16.sp)),
                                                        SizedBox(height: 3.h),
                                                        Text("places",
                                                            style: TextStyles.h1
                                                                .copyWith(
                                                                    fontSize:
                                                                        10.sp))
                                                      ],
                                                    )),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: ((context) =>
                                                                CourseDetail(array[
                                                                    index]))));
                                                  },
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(5.sp),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: Color(0xff5DCA75)
                                                            .withOpacity(0.65),
                                                      ),
                                                      child: Row(children: [
                                                        Icon(Icons.menu_book,
                                                            size: 10.sp),
                                                        Text("Detail",
                                                            style: TextStyles.h1
                                                                .copyWith(
                                                                    fontSize:
                                                                        12.sp))
                                                      ])),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                )
                              : selectedContent == "Accomodations"
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: accomodations_list.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            child: PlacesbyContentWidget(
                                          context: context,
                                          place: accomodations_list[index],
                                          isGeneral: isGeneral,
                                          fixedCustomWidgetKey:
                                              _fixedCustomWidgetKey,
                                        ));
                                      })
                                  : selectedContent == "Restaurant"
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: restaurants_list.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                                child: PlacesbyContentWidget(
                                              context: context,
                                              place: restaurants_list[index],
                                              isGeneral: isGeneral,
                                              fixedCustomWidgetKey:
                                                  _fixedCustomWidgetKey,
                                            ));
                                          })
                                      //Tourist Attraction
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              tourist_attractions_list.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                                child: PlacesbyContentWidget(
                                              context: context,
                                              place: tourist_attractions_list[
                                                  index],
                                              isGeneral: isGeneral,
                                              fixedCustomWidgetKey:
                                                  _fixedCustomWidgetKey,
                                            ));
                                          }))
                    ],
                  ),
                ),
                isGeneral == false && selectedContent != "Recommended Courses"
                    ? Positioned(
                        top: 230.h,
                        left: 30.w,
                        child: FixedCustomWidget(
                          key: _fixedCustomWidgetKey,
                        ))
                    : Spacer()
              ]);
            });
          },
        ).whenComplete(() {
          FocusScope.of(context).requestFocus(FocusNode());
        });

        setState(() {
          _containerHeight = 680.0.h;
        });
      },
      child: Text(text,
          style: TextStyles.h1.copyWith(color: Colors.white, fontSize: 20.sp)),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff5DCA75)),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 40.w, vertical: 5.h))),
    );
  }

  void _handleTap(String content) {
    setState(() {
      selectedContent = content;
    });
  }

  void cardClickEvent(BuildContext context, int index) {
    // Handle the click event for the card here
  }
}

Widget CourseDetailWidget(
    {required BuildContext buildcontext,
    required List<Place> array,
    required bool isCustom}) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: array.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  buildcontext,
                  MaterialPageRoute(
                      builder: ((context) =>
                          PlaceDetail(place: array[index]))));
            },
            child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: isCustom ? 9.w : 30.w, vertical: 10.h),
                child: Row(children: [
                  Container(
                    height: 110.h,
                    width: 135.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.asset(array[index].image),
                      ),
                    ),
                  ),
                  Container(
                      height: 85.h,
                      width: 134.7.w,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                        ),
                        color: Colors.white,
                        border: Border(
                          right: BorderSide(
                            color: Color(0xff5DCA75).withOpacity(0.65),
                            width: 2.0,
                          ),
                          top: BorderSide(
                            color: Color(0xff5DCA75).withOpacity(0.65),
                            width: 2.0,
                          ),
                          bottom: BorderSide(
                            color: Color(0xff5DCA75).withOpacity(0.65),
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(top: 20.h, right: 10.w),
                          child: Column(children: [
                            Text(array[index].name??' ',
                                textAlign: TextAlign.center,
                                style: TextStyles.h1.copyWith(fontSize: 9.sp)),
                            SizedBox(height: 5.h),
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
                                  array[index].star.toString(),
                                  style:
                                      TextStyles.h1.copyWith(fontSize: 12.sp),
                                )
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 25.w, right: 25.w),
                                child: SaveWidget(
                                  place: array[index],
                                  isSaved: saved.contains(array[index]),
                                  isCustom: isCustom,
                                ))
                          ])))
                ])));
      });
}

class SaveWidget extends StatefulWidget {
  final Place place;
  final bool isSaved;
  final bool isCustom;

  SaveWidget({
    Key? key,
    required this.place,
    required this.isSaved,
    required this.isCustom,
  }) : super(key: key);

  @override
  _SaveWidgetState createState() => _SaveWidgetState();
}

class _SaveWidgetState extends State<SaveWidget> {
  bool _isSaved = false;

  @override
  void initState() {
    super.initState();
    _isSaved = saved.contains(widget.place);
  }

  @override
  void didUpdateWidget(covariant SaveWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSaved != widget.isSaved) {
      setState(() {
        _isSaved = widget.isSaved;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSaved = !_isSaved;
          _isSaved ? saved.add(widget.place) : saved.remove(widget.place);
        });
        print(saved);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(bottom: 7.h, left: 3.w, right: 3.w),
        padding: EdgeInsets.symmetric(vertical: 0.sp, horizontal: 3.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _isSaved ? Color(0xff5DCA86).withOpacity(0.83) : Colors.white,
          border: Border.all(
            color: Color(0xff5DCA75).withOpacity(0.65),
            width: 2.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.isCustom
                  ? Icons.menu
                  : (_isSaved ? Icons.bookmark : Icons.bookmark_border),
              size: 13.sp,
            ),
            SizedBox(width: 5.w),
            Text(
              widget.isCustom ? "custom" : (_isSaved ? "Saved" : "Save"),
              textAlign: TextAlign.center,
              style: TextStyles.h1.copyWith(fontSize: 9.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomWidget extends StatefulWidget {
  final Place place;
  final bool isCustom;
  final VoidCallback? onCustomListChanged;
  final GlobalKey<_FixedCustomWidgetState> fixedCustomWidgetKey;

  CustomWidget({
    Key? key,
    required this.place,
    required this.isCustom,
    required this.fixedCustomWidgetKey,
    this.onCustomListChanged,
  }) : super(key: key);

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  bool _isCustom = false;

  @override
  void initState() {
    super.initState();
    _isCustom = custom_list.contains(widget.place);
  }

  @override
  void didUpdateWidget(covariant CustomWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isCustom != widget.isCustom) {
      setState(() {
        _isCustom = widget.isCustom;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isCustom = !_isCustom;
          _isCustom
              ? custom_list.add(widget.place)
              : custom_list.remove(widget.place);
        });
        if (widget.onCustomListChanged != null) {
          widget.onCustomListChanged!();
        }
        widget.fixedCustomWidgetKey.currentState
            ?.updateCustomListLength(custom_list.length);
        print(custom_list);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(bottom: 7.h, left: 5.w, right: 5.w),
        padding: EdgeInsets.symmetric(vertical: 0.sp, horizontal: 3.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _isCustom ? Color(0xff5DCA86).withOpacity(0.83) : Colors.white,
          border: Border.all(
            color: Color(0xff5DCA75).withOpacity(0.65),
            width: 2.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 13.sp,
            ),
            SizedBox(width: 5.w),
            Text(
              "Custom",
              textAlign: TextAlign.center,
              style: TextStyles.h1.copyWith(fontSize: 9.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class FixedCustomWidget extends StatefulWidget {
  const FixedCustomWidget({Key? key}) : super(key: key);

  @override
  State<FixedCustomWidget> createState() => _FixedCustomWidgetState();
}

class _FixedCustomWidgetState extends State<FixedCustomWidget> {
  int customListLength = custom_list.length;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => CustomCourse(array: custom_list))));
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xffD5F0C1),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Icon(
                Icons.menu_book,
                size: 15.sp,
              ),
            ),
            Container(
              width: 15.w,
              height: 15.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: Text(
                customListLength.toString(), // customListLength 사용
                textAlign: TextAlign.center,
                style: TextStyles.h1.copyWith(fontSize: 10.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateCustomListLength(int length) {
    setState(() {
      customListLength = custom_list.length;
    });
  }
}

Widget PlacesbyContentWidget({
  required BuildContext context,
  required Place place,
  required bool isGeneral,
  required GlobalKey<_FixedCustomWidgetState> fixedCustomWidgetKey,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: ((context) => PlaceDetail(place: place))),
      );
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          Container(
            height: 140.h,
            width: 194.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(place.image),
              ),
            ),
          ),
          Container(
            height: 120.h,
            width: 155.w,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
              color: Colors.white,
              border: Border(
                right: BorderSide(
                  color: Color(0xff5DCA75).withOpacity(0.65),
                  width: 2.0,
                ),
                top: BorderSide(
                  color: Color(0xff5DCA75).withOpacity(0.65),
                  width: 2.0,
                ),
                bottom: BorderSide(
                  color: Color(0xff5DCA75).withOpacity(0.65),
                  width: 2.0,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 20.h, right: 10.w),
              child: Column(
                children: [
                  Text(
                    place.name??' ',
                    textAlign: TextAlign.center,
                    style: TextStyles.h1.copyWith(fontSize: 9.sp),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_border_rounded,
                        size: 15.sp,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        place.star.toString(),
                        style: TextStyles.h1.copyWith(fontSize: 12.sp),
                      )
                    ],
                  ),
                  SizedBox(height: 15.h),
                  isGeneral == true
                      ? Padding(
                          padding: EdgeInsets.only(left: 44.w, right: 38.w),
                          child: SaveWidget(
                            place: place,
                            isSaved: saved.contains(place),
                            isCustom: false,
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(left: 9.w, right: 2.4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SaveWidget(
                                place: place,
                                isSaved: saved.contains(place),
                                isCustom: false,
                              ),
                              SizedBox(width: 5.w),
                              CustomWidget(
                                place: place,
                                isCustom: custom_list.contains(place),
                                fixedCustomWidgetKey: fixedCustomWidgetKey,
                                onCustomListChanged: () {
                                  // CustomWidget에서 custom_list가 변경되었음을 알림
                                  fixedCustomWidgetKey.currentState
                                      ?.updateCustomListLength(
                                          custom_list.length);
                                },
                              )
                            ],
                          ),
                        )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

// 위도 : 35.907757
// 경도 : 127.766922

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<GoogleMapWidget> {
  static final LatLng initialLatlng = LatLng(
    //위도와 경도 값 지정
    36.8,
    127.9,
  );

  static final CameraPosition initialPosition = CameraPosition(
    //지도를 바라보는 카메라 위치
    target: initialLatlng, //카메라 위치(위도, 경도)
    zoom: 7.5, //확대 정도
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        //구글 맵 사용
        mapType: MapType.normal, //지도 유형 설정
        initialCameraPosition: initialPosition, //지도 초기 위치 설정
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
      ),
    );
  }
}

Widget ReviewDetailWidget({required List<Review> array}) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: array.length,
      itemBuilder: (context, index) {
        return Container(
            margin: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sp),
                color: Color(0xff5DCA75).withOpacity(0.33)),
            child: Row(children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 12.w,
                    ),
                    width: 35.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 1.0.sp)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "lib/config/images/sleeping_cat.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(array[index].user,
                      style: TextStyles.h1.copyWith(fontSize: 8.sp)),
                  SizedBox(height: 5.h),
                  Text(array[index].date,
                      style: TextStyles.green.copyWith(fontSize: 5.sp))
                ],
              ),
              Container(
                  padding:
                      EdgeInsets.only(top: 12.h, bottom: 12.h, right: 10.w),
                  width: 200.w,
                  child: Text(
                    array[index].text,
                    style: TextStyles.h1.copyWith(fontSize: 8.sp),
                  )),
            ]));
      });
}

Widget ReviewShortWidget({required List<Review> array}) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: array.length,
      itemBuilder: (context, index) {
        return Container(
            margin: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sp),
                color: Color(0xff5DCA75).withOpacity(0.33)),
            child: Row(children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 5.h),
                    width: 35.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 1.0.sp)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "lib/config/images/sleeping_cat.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(array[index].user,
                      style: TextStyles.h1.copyWith(fontSize: 8.sp)),
                  SizedBox(height: 6.h),
                ],
              ),
              Container(
                  padding:
                      EdgeInsets.only(top: 12.h, bottom: 12.h, right: 10.w),
                  width: 200.w,
                  child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    array[index].text,
                    style: TextStyles.h1.copyWith(fontSize: 8.sp),
                  )),
            ]));
      });
}
