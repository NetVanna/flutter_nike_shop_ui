import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/custom_app_theme.dart';
import '../../../utils/constants.dart';


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Discover",
          style: AppThemes.homeAppBar,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.search,
              size: 25,
              color: AppConstantsColor.darkTextColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.bell,
              size: 25,
              color: AppConstantsColor.darkTextColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);

}