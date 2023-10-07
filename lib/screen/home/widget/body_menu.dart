import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/screen/home/index.dart';

class BodyMenu extends GetView<HomeController> {
  const BodyMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.all(8),
      height: 430,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.white,
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 135,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.goToNewPage(HomeState().newRoutes[index]);
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              // height: 100,
              // width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 1,
                    spreadRadius: 2,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    HomeState().iconPaths[index],
                    height: 40,
                    width: 40,
                    color: AppColors.iconColor,
                    // color: Colors.red[900],.
                  ),
                  Text(
                    HomeState().iconTitle[index],
                    style: const TextStyle(
                        letterSpacing: 2,
                        color: AppColors.fourElementText,
                        fontFamily: "Avenir",
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: HomeState().iconPaths.length,
      ),
    );
  }
}
