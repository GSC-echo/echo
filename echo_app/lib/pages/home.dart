import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_app/config/colors.dart';
import 'package:echo_app/pages/about_stage.dart';
import 'package:echo_app/pages/course_detail.dart';
import 'package:echo_app/pages/get_point.dart';
import 'package:echo_app/widgets/home_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:echo_app/widgets/other_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:echo_app/firestore.dart';

import '../config/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class Place {
  String name;
  double star;
  var image;

  Place(this.name, this.star, this.image);
}

List<Place> course1 = [
  Place("Naejangsan National Park", 4.8,
      Image.asset('lib/config/images/NaejangsanNationalPark.png')),
  Place("Walkerhill Hotels & Resorts", 4.1,
      Image.asset('lib/config/images/WalkerhillHotelsResorts.png')),
  Place("Naejangsan National Park", 4.8,
      Image.asset('lib/config/images/NaejangsanNationalPark.png')),
  Place("Walkerhill Hotels & Resorts", 4.1,
      Image.asset('lib/config/images/WalkerhillHotelsResorts.png')),
  Place("Naejangsan National Park", 4.8,
      Image.asset('lib/config/images/NaejangsanNationalPark.png')),
];

List<List<Place>> courses_array = [];

void initializeCourses() {
  courses_array = [course1, course1, course1];
}

List<Place> entire_list = [
  Place("Naejangsan National Park", 4.8,
      Image.asset('lib/config/images/NaejangsanNationalPark.png')),
  Place("Walkerhill Hotels & Resorts", 4.1,
      Image.asset('lib/config/images/WalkerhillHotelsResorts.png')),
  Place("Naejangsan National Park", 4.8,
      Image.asset('lib/config/images/NaejangsanNationalPark.png')),
  Place("Walkerhill Hotels & Resorts", 4.1,
      Image.asset('lib/config/images/WalkerhillHotelsResorts.png')),
  Place("Naejangsan National Park", 4.8,
      Image.asset('lib/config/images/NaejangsanNationalPark.png')),
];

List<Place> accomodation_list = [
  Place("Naejangsan National Park", 4.8,
      Image.asset('lib/config/images/NaejangsanNationalPark.png')),
  Place("Naejangsan National Park", 4.8,
      Image.asset('lib/config/images/NaejangsanNationalPark.png')),
  Place("Naejangsan National Park", 4.8,
      Image.asset('lib/config/images/NaejangsanNationalPark.png')),
];

List<Place> restaurant_list = [
  Place("Walkerhill Hotels & Resorts", 4.1,
      Image.asset('lib/config/images/WalkerhillHotelsResorts.png')),
  Place("Walkerhill Hotels & Resorts", 4.1,
      Image.asset('lib/config/images/WalkerhillHotelsResorts.png')),
];

List<Place> tourist_attraction_list = [
  Place("Naejangsan National Park", 4.8,
      Image.asset('lib/config/images/NaejangsanNationalPark.png')),
  Place("Walkerhill Hotels & Resorts", 4.1,
      Image.asset('lib/config/images/WalkerhillHotelsResorts.png')),
  Place("Naejangsan National Park", 4.8,
      Image.asset('lib/config/images/NaejangsanNationalPark.png')),
  Place("Walkerhill Hotels & Resorts", 4.1,
      Image.asset('lib/config/images/WalkerhillHotelsResorts.png')),
  Place("Naejangsan National Park", 4.8,
      Image.asset('lib/config/images/NaejangsanNationalPark.png')),
];

class _HomeState extends State<Home> {
  CollectionReference usersdb = FirebaseFirestore.instance.collection('User');
  String selectedContent = "Entire";
  int userPoint = 0;

  @override
  void initState() {
    super.initState();
    getUserPoints();
  }

  // Firestore에서 유저의 포인트를 가져오는 함수
  Future<void> getUserPoints() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    try {
      // Firestore에서 유저의 포인트를 가져오고
      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await FirebaseFirestore.instance.collection('User').doc(userId).get();
      // 가져온 포인트를 userPoint에 저장하고 화면을 업데이트
      setState(() {
        userPoint = userSnapshot.data()?['points'] ?? 0;
      });
    } catch (e) {
      print('Error fetching user points: $e');
    }
  }

  Map<String, dynamic> getUserStage(int p) {
    if (p < 50) {
      return {"stage": "Sprout IV", "upperBound": 50};
    } else if (p < 100) {
      return {"stage": "Sprout III", "upperBound": 100};
    } else if (p < 150) {
      return {"stage": "Sprout II", "upperBound": 150};
    } else if (p < 200) {
      return {"stage": "Sprout I", "upperBound": 200};
    } else if (p < 250) {
      return {"stage": "Seedling IV", "upperBound": 250};
    } else if (p < 300) {
      return {"stage": "Seedling III", "upperBound": 300};
    } else if (p < 350) {
      return {"stage": "Seedling II", "upperBound": 350};
    } else if (p < 400) {
      return {"stage": "Seedling I", "upperBound": 400};
    } else if (p < 500) {
      return {"stage": "Tree IV", "upperBound": 500};
    } else if (p < 600) {
      return {"stage": "Tree III", "upperBound": 600};
    } else if (p < 700) {
      return {"stage": "Tree II", "upperBound": 700};
    } else if (p < 800) {
      return {"stage": "Tree I", "upperBound": 800};
    } else if (p < 1000) {
      return {"stage": "Forest IV", "upperBound": 1000};
    } else if (p < 1200) {
      return {"stage": "Forest III", "upperBound": 1200};
    } else if (p < 1400) {
      return {"stage": "Forest II", "upperBound": 1400};
    } else {
      return {"stage": "Forest I", "upperBound": 0};
    }
  }

  Widget build(BuildContext context) {
    initializeCourses();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: BackgroundColor.mainGreen,
          title: Text("HOME", style: TextStyles.h1),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: BackgroundColor.mainGreen,
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 12.h, left: 20.w, right: 20.w),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: BackgroundColor.mainGreen.withOpacity(0.6),
                      ),
                      height: 220.h,
                      child: Column(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                SizedBox(height: 8.h),
                                Container(
                                    child: Icon(Icons.forest,
                                        size: 75, color: Colors.white)),
                                SizedBox(height: 8.h),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const AboutStage())),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.help_outline, size: 12),
                                      SizedBox(width: 2),
                                      Text(
                                        "About stages",
                                        style: TextStyle(fontSize: 11),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      getUserStage(
                                          userPoint)["stage"], //user.stage
                                      textAlign: TextAlign.center,
                                      style: TextStyles.h3
                                          .copyWith(fontSize: 28.sp),
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      " stage",
                                      style: TextStyles.white1
                                          .copyWith(fontSize: 28.sp),
                                    ),
                                  ],
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "$userPoint",
                                        style: TextStyles.h3
                                            .copyWith(fontSize: 22.sp),
                                      ),
                                      TextSpan(
                                        text: " pts",
                                        style: TextStyles.white1
                                            .copyWith(fontSize: 22.sp),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 34, right: 34, top: 5),
                                  child: ClipRRect(
                                      child: LinearPercentIndicator(
                                    percent: userPoint /
                                        getUserStage(userPoint)["upperBound"],
                                    lineHeight: 13,
                                    backgroundColor: Colors.white,
                                    progressColor:
                                        Colors.black.withOpacity(0.8),
                                    barRadius: Radius.circular(35),
                                  )),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${getUserStage(userPoint)["upperBound"] - userPoint} points until next stage!",
                                            textAlign: TextAlign.right,
                                            style: TextStyles.white1
                                                .copyWith(fontSize: 10.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Row(
                      children: [
                        //Get a Point
                        Padding(
                            padding: EdgeInsets.only(left: 25.h),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Colors.white.withOpacity(0.9)),
                                height: 50.h,
                                width: 355.h,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                const GetPoint())));
                                  },
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(width: 4.w),
                                            Icon(
                                              Icons.stars_outlined,
                                              size: 25,
                                              color: Colors.black,
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              'Complete Missions and Earn Points',
                                              textAlign: TextAlign.center,
                                              style: TextStyles.h3
                                                  .copyWith(fontSize: 14.sp),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 5.h),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ))),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 25.w),
                    child: Text(
                      "Popular Real-time Places",
                      style: TextStyles.white1.copyWith(fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      SizedBox(width: 17.w),
                      RealTimePlacesContent(
                        content: "Entire",
                        isSelected: selectedContent == "Entire",
                        onTap: () {
                          _handleTap("Entire");
                        },
                      ),
                      SizedBox(width: 8.w),
                      RealTimePlacesContent(
                        content: "Accomodation",
                        isSelected: selectedContent == "Accomodation",
                        onTap: () {
                          _handleTap("Accomodation");
                        },
                      ),
                      SizedBox(width: 8.w),
                      RealTimePlacesContent(
                        content: "Restaurant",
                        isSelected: selectedContent == "Restaurant",
                        onTap: () {
                          _handleTap("Restaurant");
                        },
                      ),
                      SizedBox(width: 8.w),
                      RealTimePlacesContent(
                        content: "Tourist Attraction",
                        isSelected: selectedContent == "Tourist Attraction",
                        onTap: () {
                          _handleTap("Tourist Attraction");
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  SingleChildScrollView(
                    padding: EdgeInsets.only(left: 15.w),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: selectedContent == "Entire"
                          ? entire_list
                              .map((place) =>
                                  RealTimePlace(context: context, place: place))
                              .toList()
                          : selectedContent == "Accomodation"
                              ? accomodation_list
                                  .map((place) => RealTimePlace(
                                      context: context, place: place))
                                  .toList()
                              : selectedContent == "Restaurant"
                                  ? restaurant_list
                                      .map((place) => RealTimePlace(
                                          context: context, place: place))
                                      .toList()
                                  : tourist_attraction_list
                                      .map((place) => RealTimePlace(
                                          context: context, place: place))
                                      .toList(),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 30.w),
                    child: Text("Popular Real-time Courses",
                        style: TextStyles.white1.copyWith(fontSize: 20)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 14.w, top: 7.h, right: 15.w, bottom: 22.h),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xff5DCA75).withOpacity(0.65),
                              width: 2.0,
                            ),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: courses_array.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    height: 115.h,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 20.h,
                                          width: 20.w,
                                          margin: EdgeInsets.only(
                                              left: 29,
                                              top: 41.h,
                                              bottom: 41.h),
                                          decoration: BoxDecoration(
                                            color: Color(0xff5DCA86),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "${index + 1}",
                                              textAlign: TextAlign.center,
                                              style: TextStyles.h1.copyWith(
                                                fontSize: 15.sp,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20.w),
                                        RealTimeCourse(
                                            context: context,
                                            array: courses_array[index]),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 23.0),
                                    child: index == 2
                                        ? null
                                        : Divider(
                                            color: Color(0xff5DCA75)
                                                .withOpacity(0.65),
                                            thickness: 2.0,
                                          ),
                                  ),
                                ],
                              );
                            },
                          )))
                ],
              ),
            ),
          ),
        ));
  }

  void _handleTap(String content) {
    setState(() {
      selectedContent = content;
    });
  }
}
