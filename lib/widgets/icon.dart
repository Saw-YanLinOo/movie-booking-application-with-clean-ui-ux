import 'package:flutter/material.dart';

import '../resources/dimens.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    Key? key,
    required this.image,
    this.color,
  }) : super(key: key);

  final String image;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MARGIN_LARGE,
      height: MARGIN_LARGE,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        color: color,
      ),
    );
  }
}
