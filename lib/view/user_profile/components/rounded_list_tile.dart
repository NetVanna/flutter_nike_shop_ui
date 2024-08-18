import 'package:flutter/material.dart';
import 'package:nike_shoe_app_ui/utils/constants.dart';

import '../../../theme/custom_app_theme.dart';

class RoundedListTile extends StatelessWidget {
  const RoundedListTile(
      {super.key,
      this.leadingBgColor,
      required this.icon,
      required this.title,
      required this.trailing});

  final Color? leadingBgColor;
  final IconData icon;
  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          width: double.infinity,
          height: 70,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: leadingBgColor,
              radius: 25,
              child: IconButton(
                onPressed: (){},
                icon: Icon(
                  icon,
                  color: AppConstantsColor.lightTextColor,
                ),
              ),
            ),
            title: Text(
              title,
              style: AppThemes.profileRepeatedListTileTitle,
            ),
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}
