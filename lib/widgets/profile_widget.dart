import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:take_note/controllers/data_controller.dart';
import 'package:take_note/controllers/view_controller.dart';
import 'package:take_note/utils/app_colors.dart';

class ProfileWidget extends StatefulWidget {
  final DataController dataController;
  final ViewController viewController;
  const ProfileWidget({
    super.key,
    required this.dataController,
    required this.viewController,
  });

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLightTheme =
          widget.viewController.state.value == Brightness.light;
      return Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 100.h,
              decoration: BoxDecoration(
                color: (isLightTheme)
                    ? AppColors.primaryLight
                    : AppColors.primaryDark,
                borderRadius: BorderRadius.circular(36.sp),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cardDarkBackground,
                      border: Border.all(
                        color: AppColors.borderLight,
                        width: 1,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/avatar1.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.dataController.appUser.value.name,
                        style: TextStyle(
                          color: (isLightTheme)
                              ? AppColors.tertiaryText
                              : AppColors.primaryText,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        widget.dataController.appUser.value.email,
                        style: TextStyle(
                          color: (isLightTheme)
                              ? AppColors.tertiaryText
                              : AppColors.primaryText,
                          fontWeight: FontWeight.w300,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 100.h),

            ElevatedButton(
              onPressed: () {
                Get.offAndToNamed('/auth');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // Full width, 50 height
              ),
              child: Text("Logout"),
            ),
          ],
        ),
      );
    });
  }
}