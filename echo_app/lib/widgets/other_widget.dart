import 'package:echo_app/config/colors.dart';
import 'package:echo_app/pages/course_detail.dart';
import 'package:echo_app/widgets/home_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  List<List<String>> array = [
    [
      "Dalmago-do",
      'Suncheon',
      "Naejangsan National Park",
      "Naejangsan National Park",
      "Naejangsan National Park",
    ],
    [
      'Suncheon',
      "Soagdo",
      "Dalmago-do",
      'Suncheon',
    ],
    [
      "Suncheon Bay National Garden",
      "Soagdo",
      "Dalmago-do",
      'Suncheon',
    ]
  ];

  double _containerHeight = 600.0.h;
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
      // 포커스가 해제되면 Container의 높이를 변경
      if (!_focusNode.hasFocus) {
        _containerHeight = 600.0; // 변경할 높이 설정
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // 다른 곳을 터치하면 포커스 해제
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: _containerHeight,
              margin: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 35.w, bottom: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.sp),
                color: Colors.white,
                border: Border.all(
                  color: Color(0xff5DCA75).withOpacity(0.65),
                  width: 2.0,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Where are you going to travel?',
                        hintStyle: TextStyles.h1.copyWith(
                            fontSize: 16, color: Colors.black.withOpacity(0.4)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
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
                          _containerHeight = 400.0;
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
                    child: searchText.isEmpty
                        ? SizedBox.shrink()
                        : Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (items[index]
                                    .toLowerCase()
                                    .contains(searchText.toLowerCase())) {
                                  return Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.elliptical(20, 20),
                                      ),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        items[index],
                                        style: TextStyles.h1
                                            .copyWith(fontSize: 16.sp),
                                        textAlign: TextAlign.center,
                                      ),
                                      onTap: () =>
                                          cardClickEvent(context, index),
                                    ),
                                  );
                                } else {
                                  return SizedBox.shrink();
                                }
                              },
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GeneralSavedButton(text: "General", array: array),
                GeneralSavedButton(text: "Saved", array: array)
              ],
            )
          ],
        ));
  }

  Widget GeneralSavedButton({required text, required array}) {
    return ElevatedButton(
      onPressed: () async {
        setState(() {
          _containerHeight = 420.0;
        });
        FocusScope.of(context).unfocus();

        await showModalBottomSheet(
          backgroundColor: Colors.white,
          enableDrag: true,
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter bottomState) {
              return Container(
                height: 300.h, // 원하는 높이로 설정
                child: SingleChildScrollView(
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
                      selectedContent == "Recommended Courses"
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
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
                                      color:
                                          Color(0xff5DCA75).withOpacity(0.65),
                                      width: 3.0.sp,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 260.w,
                                        child: RealTimeCourse(
                                            array: array[
                                                index]), //RecommendedCourses일때
                                      ),
                                      Container(
                                        color:
                                            Color(0xff5DCA75).withOpacity(0.65),
                                        width: 3.sp,
                                        height: 100.h,
                                      ),
                                      SizedBox(width: 8.w),
                                      Center(
                                        child: Column(
                                          children: [
                                            Container(
                                                padding: EdgeInsets.all(5.sp),
                                                margin: EdgeInsets.symmetric(
                                                    //horizontal: 10.w,
                                                    vertical: 5.h),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
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
                                                        style: TextStyles.h3
                                                            .copyWith(
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
                                                            const CourseDetail())));
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.all(5.sp),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
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
                          : selectedContent == "Accomodation"
                              ? Container()
                              : selectedContent == "Restaurant"
                                  ? Container()
                                  : Container()
                    ],
                  ),
                ),
              );
            });
          },
        ).whenComplete(() {
          FocusScope.of(context).requestFocus(FocusNode());
        });

        setState(() {
          _containerHeight = 600.0;
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
