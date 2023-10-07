import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:philmoney/screen/settings/controller.dart';

import '../../../common/Theme/colors.dart';

class SettingsBody extends GetView<SettingsController> {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.85,
      width: Get.width * 0.95,
      //padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        //color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildIconAndText(Icons.person_outline_outlined, "Profile"),
          const Divider(
            thickness: 2,
          ),
          _buildIconAndText(Icons.messenger_outline, "Feedback"),
          const Divider(
            thickness: 2,
          ),
          // _buildIconAndText(Icons.bookmarks_outlined, "About PhilMoney"),
          _buildIconAndText(Icons.bookmarks_outlined, "About PhilMoney"),
          const Divider(
            thickness: 2,
          ),
          _buildIconAndText(Icons.contact_mail_outlined, "ARC Verification"),
          const Divider(
            thickness: 2,
          ),
          _buildIconAndText(Icons.logout, "Log Out"),
          const Divider(
            thickness: 2,
          ),
          GestureDetector(
            onTap: () {
              controller.changeAppTheme();
            },
            child: _buildIconAndText(Icons.sunny, "Light Theme"),
            //  Obx(
            // () => controller.settingState.themeLight.value
            //     ? _buildIconAndText(Icons.sunny, "Light Theme")
            //     : _buildIconAndText(Icons.nights_stay_sharp, "Dark Theme"),
            // ),
          ),

          const Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

Widget _buildIconAndText(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        Icon(
          icon,
          size: 30,
          color: AppColors.warningText,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
              fontSize: 16,
              fontFamily: "Aviner",
              fontWeight: FontWeight.normal,
              color: AppColors.fourElementText),
        ),
      ],
    ),
  );
}
