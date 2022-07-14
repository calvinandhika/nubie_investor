import 'package:flutter/material.dart';
import 'package:nubie_investor/theme.dart';

class IconNavigation extends StatelessWidget {
  final String title;
  final String navIcon;
  final Function() onTap;
  bool isSelected;

  IconNavigation({
    Key? key,
    required this.title,
    required this.navIcon,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              navIcon,
              height: 20,
              color: isSelected ? kOrangeColor : kLightGreyColor,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              title,
              style: body6TextStyle.copyWith(
                  color: isSelected ? kOrangeColor : kLightGreyColor),
            )
          ],
        ),
      ),
    );
  }
}
