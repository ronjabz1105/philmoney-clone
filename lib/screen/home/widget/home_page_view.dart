import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/screen/home/controller.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final PageController _pageController = PageController(initialPage: 0);

  late int _activePage = 0;
  //final pvController = Get.find<HomeController>;
  final pvController = Get.put(HomeController());

  final List<Widget> _pages = [
    const PageOne(),
    const PageTwo(),
    const PageThree()
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 200,
          width: double.maxFinite,
          color: Colors.blue,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (page) {
              _activePage = pvController.activePage.value;
              //setState(() {
              // _activePage = page;
              // });
            },
            itemCount: _pages.length,
            itemBuilder: ((context, index) {
              // return _pages[index % _pages.length];
              return Obx(() => _pages[pvController.activePage.value]);
            }),
          ),
        ),
      ],
    );
  }
}

//page one
class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage("assets/images/banner1.jpg"),
      fit: BoxFit.fill,
    );
  }
}

//page two
class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage("assets/images/banner2.jpg"),
      fit: BoxFit.fill,
    );
  }
}

//page two
class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage("assets/images/banner3.jpg"),
      fit: BoxFit.fill,
    );
  }
}
