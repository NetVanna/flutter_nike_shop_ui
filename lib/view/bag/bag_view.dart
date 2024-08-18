import 'package:flutter/material.dart';
import 'package:nike_shoe_app_ui/animations/fade_animation.dart';
import 'package:nike_shoe_app_ui/data/dummy_data.dart';
import 'package:nike_shoe_app_ui/models/shoe_models.dart';
import 'package:nike_shoe_app_ui/utils/app_methods.dart';
import 'package:nike_shoe_app_ui/utils/constants.dart';

import '../../theme/custom_app_theme.dart';
import 'components/empty_state.dart';

class BagView extends StatefulWidget {
  const BagView({super.key});

  @override
  State<BagView> createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  int lengthOfItemOnBag = itemsOnBag.length;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppConstantsColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            width: width,
            height: height,
            child: Column(
              children: [
                _bagAppBar(width, height),
                itemsOnBag.isEmpty
                    ? const EmptyState()
                    : Column(
                        children: [
                          _mainProductList(width, height),
                          _bottomInfos(width, height),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _bottomInfos(double width, double height) {
    return SizedBox(
      width: width,
      height: height / 9,
      child: Column(
        children: [
          FadeAnimation(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("TOTAL", style: AppThemes.bagTotalPrice),
                Text(
                  "\$${AppMethods.allTheItemsOnBag()}",
                  style: AppThemes.bagSumOfItemOnBag,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _materialButton(width, height),
        ],
      ),
    );
  }

  Widget _materialButton(width, height) {
    return FadeAnimation(
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minWidth: width / 1.1,
        height: height / 15,
        color: AppConstantsColor.materialButtonColor,
        child: const Text(
          "NEXT",
          style: TextStyle(
            color: AppConstantsColor.lightTextColor,
          ),
        ),
      ),
    );
  }

  Widget _mainProductList(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.7,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: itemsOnBag.length,
        itemBuilder: (context, index) {
          ShoeModel currentBagItem = itemsOnBag[index];
          return Container(
            // color: Colors.red,
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: height * 0.17,
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(30),
                        width: width * 0.38,
                        decoration: BoxDecoration(
                          color: currentBagItem.modelColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      Positioned(
                        right: 1,
                        bottom: 25,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(-40 / 360),
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: Image(
                              image: AssetImage(
                                currentBagItem.imgAddress,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentBagItem.model,
                      style: AppThemes.bagProductModel,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "\$${currentBagItem.price}",
                      style: AppThemes.bagProductPrice,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300]),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  itemsOnBag.remove(currentBagItem);
                                  lengthOfItemOnBag = itemsOnBag.length;
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300]),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox _bagAppBar(double width, double height) {
    return SizedBox(
      width: width,
      height: height / 14,
      child: FadeAnimation(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "My Bag",
              style: AppThemes.bagTitle,
            ),
            Text(
              "Total $lengthOfItemOnBag Items",
              style: AppThemes.bagTotalPrice,
            )
          ],
        ),
      ),
    );
  }
}
