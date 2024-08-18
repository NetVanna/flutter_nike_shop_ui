import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nike_shoe_app_ui/animations/fade_animation.dart';
import 'package:nike_shoe_app_ui/data/dummy_data.dart';
import 'package:nike_shoe_app_ui/utils/app_methods.dart';
import 'package:nike_shoe_app_ui/utils/constants.dart';

import '../../models/shoe_models.dart';
import '../../theme/custom_app_theme.dart';
import 'components/app_bar.dart';

class DetailView extends StatefulWidget {
  const DetailView(
      {super.key, required this.model, required this.isComeFromMoreSection});

  final ShoeModel model;
  final bool isComeFromMoreSection;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  bool _isCountrySelected = false;
  int? _isSizeSelected;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: const CustomDetailsViewAppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height * 1.1,
            child: Column(
              children: [
                _topProductImageAndBg(size),
                _morePicOfProduct(size),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(),
                ),
                _sizeAndCountrySelectionSection(size),
                _bottomSizeSelection(size),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _addToBagButton(size),
      ),
    );
  }

  MaterialButton _addToBagButton(Size size) {
    return MaterialButton(
        padding: const EdgeInsets.all(25),
        minWidth: size.width / 1.1,
        height: size.height / 18,
        color: widget.model.modelColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25)),
        ),
        onPressed: () {
          AppMethods.addToCart(widget.model, context);
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ADD TO BAG",
              style: TextStyle(
                  color: AppConstantsColor.lightTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 35,
            ),
          ],
        ),
      );
  }

  Widget _bottomSizeSelection(Size size) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 10),
      width: size.width,
      height: size.height * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width / 4.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey)),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Try it",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  SizedBox(width: 8),
                  RotatedBox(
                    quarterTurns: -1,
                    child: FaIcon(FontAwesomeIcons.shoePrints),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.65,
            child: ListView.builder(
              itemCount: sizes.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSizeSelected = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: size.width * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _isSizeSelected == index
                          ? Colors.black
                          : Colors.white,
                      border: Border.all(
                        color: _isSizeSelected == index
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        sizes[index].toString(),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: _isSizeSelected == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _sizeAndCountrySelectionSection(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _productNameAndPrice(),
          _productInfo(size.width, size.height),
          _moreDetailText(size.width, size.height),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Size",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppConstantsColor.darkTextColor,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.32,
                  height: size.height * 0.05,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isCountrySelected = !_isCountrySelected;
                          });
                        },
                        child: Text(
                          "UK",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: _isCountrySelected
                                ? FontWeight.w400
                                : FontWeight.bold,
                            color: _isCountrySelected
                                ? Colors.grey
                                : AppConstantsColor.darkTextColor,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isCountrySelected = true;
                          });
                        },
                        child: Text(
                          "USA",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: _isCountrySelected
                                ? FontWeight.w400
                                : FontWeight.bold,
                            color: !_isCountrySelected
                                ? Colors.grey
                                : AppConstantsColor.darkTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _productInfo(width, height) {
    return FadeAnimation(
      duration: 1500,
      child: SizedBox(
        width: width,
        height: height / 13,
        child: Text(
          "Lorem Ipsum is simply dummy text of the printing and "
          "typesetting industry. Lorem Ipsum has been the industry's standard "
          "dummy text ever since the 1500s",
          style: AppThemes.detailsProductDescriptions,
        ),
      ),
    );
  }

  Widget _moreDetailText(width, height) {
    return FadeAnimation(
      child: SizedBox(
        height: height / 35,
        child: FittedBox(
          child: Text(
            "More Details".toUpperCase(),
            style: AppThemes.detailsMoreText,
          ),
        ),
      ),
    );
  }

  Widget _productNameAndPrice() {
    return FadeAnimation(
      child: Row(
        children: [
          Text(
            widget.model.model,
            style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppConstantsColor.darkTextColor),
          ),
          Expanded(child: Container()),
          Text(
            "\$${widget.model.price.toStringAsFixed(2)}",
            style: AppThemes.detailsProductPrice,
          ),
        ],
      ),
    );
  }

  Widget _morePicOfProduct(Size size) {
    return FadeAnimation(
      child: SizedBox(
        width: size.width,
        height: size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4,
            (index) => index != 3
                ? roundedImage(size.width, size.height)
                : Container(
                    padding: const EdgeInsets.all(12),
                    width: size.width / 5,
                    height: size.height / 14,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: DecorationImage(
                        image: AssetImage(widget.model.imgAddress),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.grey.withOpacity(1), BlendMode.darken),
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_circle_fill,
                        color: AppConstantsColor.lightTextColor,
                        size: 30,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _topProductImageAndBg(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height / 2.3,
      child: Stack(
        children: [
          Positioned(
            left: 60,
            bottom: 20,
            child: FadeAnimation(
              child: Container(
                width: size.width,
                height: size.height / 2.2,
                decoration: BoxDecoration(
                  color: widget.model.modelColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(1500),
                      bottomRight: Radius.circular(100)),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: Hero(
              tag: widget.isComeFromMoreSection
                  ? widget.model.model
                  : widget.model.imgAddress,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-25 / 360),
                child: SizedBox(
                  width: size.width / 1.3,
                  height: size.height / 4.3,
                  child: Image.asset(widget.model.imgAddress),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  roundedImage(width, height) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      padding: const EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
      child: Image.asset(widget.model.imgAddress),
    );
  }
}
