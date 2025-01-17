import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Controller/Home/FriendsActivityController.dart';
import '../../../Resource/color_handler.dart';
import '../../../Resource/font-handler.dart';
import '../../../Resource/icon_handler.dart';
import '../../LayoutScreens/HomepageLayout/UserProgressBarLayout.dart';
import '../../LayoutScreens/AnalyticspageLayout/UserStats.dart';
import '../../chart_screens/activty_chart.dart';

class FriendsActivityScreen extends StatelessWidget {
  const FriendsActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FriendsActivityController controller = Get.put(FriendsActivityController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorHandler.bgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconHandler.angle_left,
            color: ColorHandler.normalFont,
          ),
        ),
      ),
      backgroundColor: ColorHandler.bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutBuilder(
              builder: (BuildContext ctx, BoxConstraints constraints) {
                return UserProgressBarLayout();
              },
            ),
            SizedBox(
              height: 20.r,
            ),
            LayoutBuilder(
              builder: (BuildContext ctx, BoxConstraints constraints) {
                return UserStats();
              },
            ),
            SizedBox(
              height: 10.r,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 350.r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: FontHandler(
                      "Engagement Rate",
                      color: ColorHandler.normalFont,
                      textAlign: TextAlign.start,
                      fontsize: 20.sp,
                      fontweight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(() {
                    return ActivityChart(
                      isanalysis: true,
                      engagementRate: controller.engagementRate.value, // Pass the reactive value
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
