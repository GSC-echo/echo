import 'package:echo_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 670.h, //일단 이렇게..
          margin:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 35.w, bottom: 10.w),
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
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
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
                                    style:
                                        TextStyles.h1.copyWith(fontSize: 16.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () => cardClickEvent(context, index),
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
            ElevatedButton(
              onPressed: () {},
              child: Text('Button 1'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Button 2'),
            ),
          ],
        ),
      ],
    );
  }

  void cardClickEvent(BuildContext context, int index) {
    // Handle the click event for the card here
  }
}
