import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/screen/home/widget/body_menu.dart';

import 'index.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.submitButtonBlue,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'PhilM',
            style: TextStyle(
              fontFamily: "Avenir",
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image(
            image: AssetImage('assets/icons/coin.png'),
            height: 12,
            width: 12,
            color: Colors.white,
          ),
          Text(
            'ney',
            style: TextStyle(
              fontFamily: "Avenir",
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _currentRatings() {
    return Container(
      padding: const EdgeInsets.only(right: 10, left: 10),
      height: 50,
      width: double.maxFinite,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              // color: Colors.blueGrey,
              borderRadius: const BorderRadius.all(Radius.circular(15)),

              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: const Offset(-1, 1),
                  color: Colors.grey.withOpacity(0.2),
                )
              ],
            ),
            child: const Image(
              image: AssetImage("assets/images/taiwan.png"),
            ),
          ),
          Row(
            children: const [
              Text(
                '1',
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'NTD ',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.right,
                ),
              ),
              Text(
                '  =  ',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
              ),
              Text(
                '1.784',
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'PHP',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: const Offset(-1, 1),
                  color: Colors.grey.withOpacity(0.2),
                )
              ],
            ),
            child: const Image(
              image: AssetImage("assets/images/philippines.png"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: AppColors.thirdElementText,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomePageView(),
              _currentRatings(),
              const BodyMenu(),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  "2.0.6",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
