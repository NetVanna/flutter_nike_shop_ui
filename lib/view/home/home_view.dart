import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nike_shoe_app_ui/animations/fade_animation.dart';
import 'package:nike_shoe_app_ui/data/dummy_data.dart';
import 'package:nike_shoe_app_ui/models/shoe_models.dart';
import 'package:nike_shoe_app_ui/theme/custom_app_theme.dart';
import 'package:nike_shoe_app_ui/utils/constants.dart';
import 'package:nike_shoe_app_ui/view/details/detail_view.dart';

import 'components/home_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndexItem = 0;
  int selectedIndexFeature = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstantsColor.backgroundColor,
      appBar: const HomeAppBar(),
      body: Column(
        children: [
          _categoryView(size),
          SizedBox(height: size.height * 0.01),
          _mainShoesListView(size),
          _moreTextAndIcon(),
          _bottomSideCategory(size),
        ],
      ),
    );
  }

  SizedBox _bottomSideCategory(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.3,
      child: ListView.builder(
        itemCount: availableShoes.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          ShoeModel model = availableShoes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailView(
                    model: model,
                    isComeFromMoreSection: true,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              width: size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    left: 5,
                    child: FadeAnimation(
                      duration: 1000,
                      child: Container(
                        width: size.width / 13,
                        height: size.height / 10,
                        color: Colors.red,
                        child: const RotatedBox(
                          quarterTurns: -1,
                          child: Center(
                            child: FadeAnimation(
                              duration: 1500,
                              child: Text(
                                "New",
                                style: AppThemes.homeGridNewText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 10,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 10,
                    child: FadeAnimation(
                      child: RotationTransition(
                        turns: const AlwaysStoppedAnimation(-20 / 360),
                        child: Hero(
                          tag: model.model,
                          child: Image.asset(
                            model.imgAddress,
                            width: size.width * 0.45,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    child: FadeAnimation(
                      child: SizedBox(
                        width: size.width / 4,
                        height: size.height / 42,
                        child: FittedBox(
                          child: Text(
                            "${model.name} ${model.model}",
                            style: AppThemes.homeGridNameAndModel,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    child: FadeAnimation(
                      duration: 1500,
                      child: Text(
                        "\$${model.price.toStringAsFixed(2)}",
                        style: AppThemes.homeGridPrice,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _moreTextAndIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "More",
            style: AppThemes.homeMoreText,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward,
              size: 27,
            ),
          ),
        ],
      ),
    );
  }

  Row _mainShoesListView(Size size) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          width: size.width / 16,
          height: size.height / 2.4,
          // color: Colors.red,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: featured.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndexFeature = index;
                    });
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Center(
                      child: Text(
                        featured[index],
                        style: TextStyle(
                          fontSize: selectedIndexFeature == index ? 21 : 18,
                          color: selectedIndexFeature == index
                              ? AppConstantsColor.darkTextColor
                              : AppConstantsColor.unSelectedTextColor,
                          fontWeight: selectedIndexFeature == index
                              ? FontWeight.w700
                              : null,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.89,
          height: size.height * 0.4,
          // color: Colors.red,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: availableShoes.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                ShoeModel model = availableShoes[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailView(
                          model: model,
                          isComeFromMoreSection: false,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(size.height * 0.01),
                    width: size.width / 1.5,
                    child: Stack(
                      children: [
                        Container(
                          width: size.width / 1.7,
                          decoration: BoxDecoration(
                              color: model.modelColor,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Positioned(
                          left: 25,
                          right: 45,
                          child: FadeAnimation(
                            duration: 500,
                            child: Row(
                              children: [
                                Text(
                                  model.name,
                                  style: AppThemes.homeProductModel,
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_border,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 45,
                          left: 25,
                          child: FadeAnimation(
                            duration: 1000,
                            child: Text(
                              model.model,
                              style: AppThemes.homeProductModel,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 80,
                          left: 25,
                          child: FadeAnimation(
                            duration: 1500,
                            child: Text(
                              "\$${model.price.toStringAsFixed(2)}",
                              style: AppThemes.homeProductModel,
                            ),
                          ),
                        ),
                        Positioned(
                          right: -5,
                          top: 50,
                          child: FadeAnimation(
                            duration: 2000,
                            child: Hero(
                              tag: model.imgAddress,
                              child: RotationTransition(
                                turns: const AlwaysStoppedAnimation(-40 / 360),
                                child: SizedBox(
                                  width: 300,
                                  height: 280,
                                  child: Image.asset(model.imgAddress),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 40,
                          child: IconButton(
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.arrowCircleRight,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget _categoryView(Size size) {
    return Row(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.05,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndexItem = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Center(
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontSize: selectedIndexItem == index ? 21 : 18,
                        color: selectedIndexItem == index
                            ? AppConstantsColor.darkTextColor
                            : AppConstantsColor.unSelectedTextColor,
                        fontWeight:
                            selectedIndexItem == index ? FontWeight.w700 : null,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
