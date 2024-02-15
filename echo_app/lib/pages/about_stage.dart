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
          backgroundColor: BackgroundColor.mainGreen,
          title: Text("Tiers", style: TextStyles.h1),
          centerTitle: true,
        ),
        body: Container(
            decoration: const BoxDecoration(color: BackgroundColor.mainGreen),
            padding: EdgeInsets.zero,
            child: Padding(
                padding: EdgeInsets.only(
                    left: 14.w, top: 7.h, right: 15.w, bottom: 5.h),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xff5DCA75).withOpacity(0.65),
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
                      'Sprout IV: 0 ~ 49\nSprout III: 50 ~ 99\nSprout II: 100 ~ 149\nSprout I: 150 ~ 199',
                      'Seedling IV: 200 ~ 249\nSeedling III: 250 ~ 299\nSeedling II: 300 ~ 349\nSeedling I: 350 ~ 399',
                      'Tree IV: 400 ~ 499\nTree III: 500 ~ 599\nTree II: 600 ~ 699\nTree I: 700 ~ 799',
                      'Sprout IV: 800 ~ 999\nSprout III: 1000 ~ 1199\nSprout II: 1200 ~ 1399\nSprout I: 1400 ~ ',
                    ])))));
  }
}
