import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/routes/names.dart';

class CommonAppbar extends StatelessWidget {
  bool isBack;
  String? title;

  CommonAppbar({
    Key? key,
    this.isBack = true,
    this.title = "PhilMoney",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isBack
              ? GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Image(
                    image: AssetImage('assets/icons/back.png'),
                    color: AppColors.secondaryElement,
                    height: 35,
                    width: 35,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    Get.offAllNamed(AppRoutes.HOME);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/icons/remove.png'),
                      color: AppColors.secondaryElement,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
          Text(
            title!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: AppColors.secondaryElement,
              letterSpacing: 1,
            ),
          ),

          // const Image(
          //   image: AssetImage('assets/icons/back.png'),
          //   color: AppColors.secondaryElement,
          //   height: 35,
          //   width: 35,
          // ),
          // title == 'History'
          //     ? IconButton(
          //         onPressed: () {
          //           Get.offAllNamed(AppRoutes.HOME);
          //         },
          //         icon: const Icon(
          //           Icons.home,
          //           color: AppColors.secondaryElement,
          //           size: 30,
          //         ))
          // :
          Container(),
        ],
      ),
    );
  }
}
