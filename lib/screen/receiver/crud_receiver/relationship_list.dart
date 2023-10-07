import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/widget/background.dart';
import 'package:philmoney/common/widget/commonAppBar.dart';
import 'package:philmoney/screen/receiver/controller.dart';

class RelationshipListScreen extends StatelessWidget {
  const RelationshipListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: MainBackground(),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CommonAppbar(title: "Select Relationship"),
            ),
            const Positioned(
              top: 50,
              left: 10,
              child: RelationshipList(),
            )
          ],
        ),
      ),
    );
  }
}

class RelationshipList extends GetView<ReceiverController> {
  const RelationshipList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.7,
      width: Get.width * 0.95,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          _buildText("Parent", controller),
          _buildText("Children", controller),
          _buildText("Spouse", controller),
          _buildText("Relative", controller),
          _buildText("Friend", controller),
          _buildText("Own Account", controller),
        ],
      ),
    );
  }
}

Widget _buildText(text, controller) {
  return GestureDetector(
    onTap: () {
      controller.updateRelationshipController(text);
    },
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: const TextStyle(
            color: AppColors.fourElementText,
            fontSize: 20,
            fontWeight: FontWeight.normal),
      ),
    ),
  );
}
