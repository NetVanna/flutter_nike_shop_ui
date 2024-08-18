import 'package:flutter/material.dart';
import 'package:nike_shoe_app_ui/animations/fade_animation.dart';
import 'package:nike_shoe_app_ui/theme/custom_app_theme.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 0.8,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeAnimation(
            child: Text(
              "No Shoe Added",
              style: AppThemes.bagEmptyListTitle,
            ),
          ),
          FadeAnimation(
            child: Text(
              "Once you have added, come back:",
              style: AppThemes.bagEmptyListSubTitle,
            ),
          ),
        ],
      ),
    );
  }
}
