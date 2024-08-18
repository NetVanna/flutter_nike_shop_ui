import 'package:flutter/material.dart';
import 'package:nike_shoe_app_ui/animations/fade_animation.dart';
import 'package:nike_shoe_app_ui/data/dummy_data.dart';
import 'package:nike_shoe_app_ui/models/user_status.dart';
import 'package:nike_shoe_app_ui/utils/constants.dart';

import '../../theme/custom_app_theme.dart';
import 'components/app_bar.dart';
import 'components/rounded_list_tile.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  int statusCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppConstantsColor.backgroundColor,
      appBar: const UserViewAppBar(),
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 7),
          child: Column(
            children: [
              _topUserInfo(width),
              SizedBox(height: height * 0.01),
              _userStatusListView(width, height),
              SizedBox(height: height * 0.01),
              _roundedLists(width, height),
              _bottomSideTexts(width, height),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomSideTexts(double width, double height) {
    return FadeAnimation(
      child: SizedBox(
        width: width,
        height: height / 6.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "My Account",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                  fontSize: 17),
            ),
            SizedBox(height: height * 0.008),
            const Text(
              "Switch to other Account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
            SizedBox(height: height * 0.002),
            const Text(
              "Log Out",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _roundedLists(double width, double height) {
    return FadeAnimation(
      child: SizedBox(
        width: width,
        height: height * 0.35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Dashboard",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 18),
            ),
            SizedBox(height: height * 0.01),
            RoundedListTile(
              icon: Icons.wallet_travel_outlined,
              title: 'Payment',
              leadingBgColor: Colors.green,
              trailing: Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[700],
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "2 New",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
            RoundedListTile(
              icon: Icons.archive,
              title: "Achievement's",
              leadingBgColor: Colors.yellow,
              trailing: Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
            RoundedListTile(
              icon: Icons.shield,
              title: "Privacy",
              leadingBgColor: Colors.grey,
              trailing: Container(
                width: 170,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red[700],
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Action Needed",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userStatusListView(double width, double height) {
    return FadeAnimation(
      duration: 1200,
      child: SizedBox(
        width: width,
        height: height * 0.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Status",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontSize: 20),
            ),
            SizedBox(height: height * 0.005),
            SizedBox(
              width: width,
              height: height * 0.06,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: userStatus.length,
                itemBuilder: (context, index) {
                  UserStatus status = userStatus[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        statusCurrentIndex = index;
                      });
                    },
                    child: Container(
                      width: 120,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: statusCurrentIndex == index
                              ? status.selectColor
                              : status.unSelectColor,
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            status.emoji,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            status.txt,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppConstantsColor.lightTextColor,
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topUserInfo(double width) {
    return FadeAnimation(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            backgroundImage: AssetImage("assets/images/profile_pic.png"),
          ),
          SizedBox(width: width * 0.02),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Learning Flutter",
                style: AppThemes.profileDevName,
              ),
              Text(
                "Flutter Developer",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(width: width * 0.05),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
