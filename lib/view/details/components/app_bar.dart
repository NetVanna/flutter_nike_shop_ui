import 'package:flutter/material.dart';

import '../../../theme/custom_app_theme.dart';
import '../../../utils/constants.dart';

class CustomDetailsViewAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomDetailsViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: const Text(
        "Nike",
        style: AppThemes.detailsAppBar,
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: AppConstantsColor.lightTextColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border,
            color: AppConstantsColor.lightTextColor,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);
}