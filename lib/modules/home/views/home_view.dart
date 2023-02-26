import 'package:carousel_slider/carousel_slider.dart';
import 'package:css/constants/app_colors.dart';
import 'package:css/modules/home/controller/controller.dart';
import 'package:css/modules/start/start_view.dart';
import 'package:css/utils/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

part 'widgets/home_card.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final homeController = HomeController.instance;

  static final views = [
    HomeView(),
    const StartView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg_home.png'),
                  fit: BoxFit.fill)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: const [
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Base On the Facility You Have Visited',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                // color: Colors.red,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white70,
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.white70])),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(children: [
                    const SizedBox(
                      height: 0.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Other BUPC Building",
                            style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.blue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        _SurveyCard(),
                      ],
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                ),
                child: Obx(
                  () => BottomNavigationBar(
                    currentIndex: homeController.selectedIndex.value,
                    onTap: homeController.updateSelectedIndex,
                    showSelectedLabels: false,
                    backgroundColor: Colors.white,
                    selectedFontSize: 12,
                    elevation: 0,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: _BottomNavigationBarItemIcon(
                          iconAsset:
                              'assets/images/bottom_navigation_bar/home_icon.png',
                          iconColor: AppColors.hex707070,
                        ),
                        activeIcon: _BottomNavigationBarItemIcon(
                          iconAsset:
                              'assets/images/bottom_navigation_bar/home_icon.png',
                          iconColor: AppColors.blue,
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: _BottomNavigationBarItemIcon(
                          iconAsset:
                              'assets/images/bottom_navigation_bar/profile_icon.png',
                          iconColor: AppColors.hex707070,
                        ),
                        activeIcon: _BottomNavigationBarItemIcon(
                          iconAsset:
                              'assets/images/bottom_navigation_bar/profile_icon.png',
                          iconColor: AppColors.blue,
                        ),
                        label: 'People',
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}

class _BottomNavigationBarItemIcon extends StatelessWidget {
  const _BottomNavigationBarItemIcon({
    Key? key,
    required this.iconAsset,
    this.iconColor,
  }) : super(key: key);

  final String iconAsset;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Image.asset(
        iconAsset,
        height: 23,
        color: iconColor,
      ),
    );
  }
}
