import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/colors.dart';
import '../widgets/home_widget.dart';

class AboutStage extends StatelessWidget {
  const AboutStage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: BackgroundColor.background1,
          title: Text("About Stage", style: TextStyles.h1),
          centerTitle: true,
        ),
        body: Container(
            decoration: BoxDecoration(color: BackgroundColor.background1),
            padding: EdgeInsets.zero,
            child: Padding(
                padding: EdgeInsets.only(
                    left: 14.w, top: 7.h, right: 15.w, bottom: 5.h),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xff5DCA75).withOpacity(0.65),
                        width: 2.0,
                      ),
                    ),
                    child: AboutStageWidget(imageUrlList: [
                      'lib/config/images/sprout.png',
                      'lib/config/images/sprout.png',
                      'lib/config/images/sprout.png',
                      'lib/config/images/sprout.png',
                    ], stageList: [
                      'Sprout',
                      'Seedling',
                      'Tree',
                      'Forest'
                    ], detailList: [
                      'Sprout 설명 어쩌구 저쩌구\n 어쩌구 저쩌구\n 어쩌구 저쩌구 어쩌구 저쩌구\n 어쩌구 저쩌구\n 어쩌구 저쩌구\n 어쩌구 저쩌구 어쩌구 저쩌구',
                      'Seedling 설명 어쩌구 저쩌구\n 어쩌구 저쩌구\n 어쩌구 저쩌구 어쩌구 저쩌구\n 어쩌구 저쩌구\n 어쩌구 저쩌구\n 어쩌구 저쩌구 어쩌구 저쩌구',
                      'Tree 설명 어쩌구 저쩌구\n 어쩌구 저쩌구\n 어쩌구 저쩌구 어쩌구 저쩌구\n 어쩌구 저쩌구\n 어쩌구 저쩌구\n 어쩌구 저쩌구 어쩌구 저쩌구',
                      'Forest 설명 어쩌구 저쩌구\n 어쩌구 저쩌구\n 어쩌구 저쩌구 어쩌구 저쩌구\n 어쩌구 저쩌구\n 어쩌구 저쩌구\n 어쩌구 저쩌구 어쩌구 저쩌구'
                    ])))));
  }
}
