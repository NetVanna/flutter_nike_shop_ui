import 'package:flutter/material.dart';

import '../../../theme/custom_app_theme.dart';
import '../../../utils/constants.dart';

class UserViewAppBar extends StatelessWidget implements PreferredSizeWidget{
  const UserViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text(
          "My Profile",
          style: AppThemes.profileAppBarTitle,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(top: 8, right: 8),
          child: Icon(
            Icons.more_vert,
            color: AppConstantsColor.darkTextColor,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);
}