import 'dart:ffi';

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
import 'package:echo_app/firestore.dart' as fs;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class Review {
  String user;
  String text;
  String date;

  Review(this.user, this.text, this.date);
}

List<Review> review_list = [
  Review(
      "jiwoo",
      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "2 days ago"),
  Review(
      "hyein",
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
      "a week ago"),
  Review(
      "chaeyoung",
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
      "September 2023"),
  Review(
      "seungwoo",
      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "May 2023"),
  Review(
      "jiwoo",
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
      "April 2022"),
  Review(
      "seungwoo",
      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "May 2023"),
];

class Place {
  String? id;
  String? name;
  double? star;
  String? image;
  String? category;
  GeoPoint? geoPoint;
  String? address;

  Place(
      {this.id,
      this.name,
      this.star,
      this.image,
      this.category,
      this.geoPoint,
      this.address});

  Place.fromJson(Map<String, Object?> json)
      : name = json['name'] as String?,
        star = double.tryParse(json['grade']?.toString() ?? ''),
        image = json['image_link'] as String?,
        category = json['category'] as String?,
        geoPoint = json['location'] != null
            ? GeoPoint(
                (json['location'] as Map<String, dynamic>)['latitude']
                    as double,
                (json['location'] as Map<String, dynamic>)['longitude']
                    as double,
              )
            : null,
        address = json['address'] as String?;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['grade'] = star;
    data['image_link'] = image;
    data['category'] = category;
    if (geoPoint != null) {
      data['location'] = {
        'latitude': geoPoint!.latitude,
        'longitude': geoPoint!.longitude,
      };
    }
    // data['location'] = geoPoint;
    data['address'] = address;
    return data;
  }
}

List<Place> course1 = [
  // Place("Naejangsan National Park", 4.8,
  //     'lib/config/images/course/NaejangsanNationalPark.png'),
  // Place("Amisan Observatory", 4.8,
  //     'lib/config/images/course/AmisanObservatory.png'),
  // Place("Walkerhill Hotels & Resorts", 4.1,
  //     'lib/config/images/course/WalkerhillHotelsResorts.png'),
  // Place("DunjuPeak Hanbando", 4.1,
  //     'lib/config/images/course/DunjuPeakHanbando.png'),
];
List<Place> all_list = [];
List<Place> accomodations_list = [];
List<Place> restaurants_list = [];
List<Place> tourist_attractions_list = [];

Future<void> initializePlaces() async {
  final placeList = FirebaseFirestore.instance.collection("Site");

  placeList.snapshots().listen((snapshot) {
    all_list = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()!;
      return Place(
        id: doc.id,
        name: data['name'] as String?,
        star: double.tryParse(data['grade']?.toString() ?? ''),
        image: data['image_link'] as String?,
        category: data['category'] as String?,
        geoPoint: data['location'] as GeoPoint?,
        address: data['address'] as String?,
      );
    }).toList();

    all_list.forEach((place) {
      String placeId = place.id!;
      print(
          'Place ID: $placeId, Name: ${place.name}, Star: ${place.star}, Category: ${place.category} , Geopoint: (${place.geoPoint!.latitude}, ${place.geoPoint!.longitude}) , Address: ${place.address}');
      switch (place.category) {
        case 'accomodation':
          accomodations_list.add(place);
          break;
        case 'restaurant':
          restaurants_list.add(place);
          break;
        case 'tourist_attraction':
          tourist_attractions_list.add(place);
          break;
        default:
          break;
      }
    });

    if (all_list.isNotEmpty) {
      all_list.sort((a, b) => (b.star ?? 0).compareTo(a.star ?? 0));
    }
    if (accomodations_list.isNotEmpty) {
      accomodations_list.sort((a, b) => (b.star ?? 0).compareTo(a.star ?? 0));
    }
    if (restaurants_list.isNotEmpty) {
      restaurants_list.sort((a, b) => (b.star ?? 0).compareTo(a.star ?? 0));
    }
    if (tourist_attractions_list.isNotEmpty) {
      tourist_attractions_list
          .sort((a, b) => (b.star ?? 0).compareTo(a.star ?? 0));
    }
  });
}

class Course {
  bool? customed;
  //List<Review>? review; //바꿔야됨
  List<Place>? places;

  Course({this.customed, this.places});

  Course.fromJson(Map<String, Object?> json)
      : //review = json['review'] as List<Review>?,
        customed = json['customed'] as bool?;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['customed'] = customed;
    //data['review'] = review;
    return data;
  }
}

List<List<Place>> courses_array = [];
List<Course> course_list = [];
Future<void> initializeCourses() async {
  final courseList = FirebaseFirestore.instance.collection("Course");

  courseList.snapshots().listen((snapshot) {
    course_list = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()!;
      List<String> sidList = List<String>.from(data['sid_list'] ?? []);
      List<Place> places = [];

      sidList.forEach((sid) {
        Place? place = all_list.firstWhere((place) => place.id == sid);
        if (place != null) {
          places.add(place);
        }
      });

      return Course(
        customed: data['customed'] as bool?,
        places: places,
      );
    }).toList();
    course_list.forEach((course) {
      courses_array.add(course.places ?? []);
      print(
          'Customed: ${course.customed}, Places: ${course.places?.map((place) => place.name).join(',')}');
    });
  });
}

class _HomeState extends State<Home> {
  CollectionReference usersdb = FirebaseFirestore.instance.collection('User');
  String selectedContent = "All";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    try {
      courses_array.isEmpty ? await initializePlaces() : null;
      courses_array.isEmpty ? initializeCourses() : null;
      await getUserPoints();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Error initializing data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> getUserPoints() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    try {
      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await FirebaseFirestore.instance.collection('User').doc(userId).get();
      setState(() {
        fs.userPoint = userSnapshot.data()?['points'] ?? 0;
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
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   title: Text("HOME", style: TextStyles.h1),
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: BackgroundColor.mainGreen,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
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
                                    size: 75,
                                    color: BackgroundColor.background1)),
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
                                      fs.userPoint)["stage"], //user.stage
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyles.h3.copyWith(fontSize: 28.sp),
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
                                    text: fs.userPoint.toString(),
                                    style:
                                        TextStyles.h3.copyWith(fontSize: 22.sp),
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
                                percent: fs.userPoint /
                                    getUserStage(fs.userPoint)["upperBound"],
                                lineHeight: 13,
                                backgroundColor: Colors.white,
                                progressColor: Colors.black.withOpacity(0.8),
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
                                        "${getUserStage(fs.userPoint)["upperBound"] - fs.userPoint} points until next stage!",
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
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: Center(
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
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
                                                .copyWith(fontSize: 15.sp),
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
                              )),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Container(
                color: Colors.white,
                width: double.infinity,
                height: 250,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.place,
                            color: TextStyles.echoNavy,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Popular Real-time Places",
                            style: TextStyles.h3.copyWith(fontSize: 22),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        SizedBox(width: 17.w),
                        RealTimePlacesContent(
                          content: "All",
                          isSelected: selectedContent == "All",
                          onTap: () {
                            _handleTap("All");
                          },
                        ),
                        SizedBox(width: 6.w),
                        RealTimePlacesContent(
                          content: "Accomodations",
                          isSelected: selectedContent == "Accomodations",
                          onTap: () {
                            _handleTap("Accomodations");
                          },
                        ),
                        SizedBox(width: 6.w),
                        RealTimePlacesContent(
                          content: "Restaurants",
                          isSelected: selectedContent == "Restaurants",
                          onTap: () {
                            _handleTap("Restaurants");
                          },
                        ),
                        SizedBox(width: 6.w),
                        RealTimePlacesContent(
                          content: "Tourist Attractions",
                          isSelected: selectedContent == "Tourist Attractions",
                          onTap: () {
                            _handleTap("Tourist Attractions");
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var place in (selectedContent == "All"
                              ? all_list
                              : selectedContent == "Accomodations"
                                  ? accomodations_list
                                  : selectedContent == "Restaurants"
                                      ? restaurants_list
                                      : tourist_attractions_list))
                            Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child:
                                  RealTimePlace(context: context, place: place),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: BackgroundColor.mainGreen,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 15.h),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.travel_explore,
                            color: TextStyles.echoNavy,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text("Popular Real-time Courses",
                              style: TextStyles.h3.copyWith(fontSize: 22)),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 10.w, top: 15.h, right: 10.w, bottom: 22.h),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: BackgroundColor.background1,
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
                                              color: TextStyles.echoNavy,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${index + 1}",
                                                textAlign: TextAlign.center,
                                                style: TextStyles.h1.copyWith(
                                                  fontSize: 13.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 20.w),
                                          RealTimeCourse(
                                              context: context,
                                              array: courses_array[index],
                                              isinMap: false),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 23.0),
                                      child: index == courses_array.length - 1
                                          ? null
                                          : Divider(
                                              color: TextStyles.echoNavy
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
