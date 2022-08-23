import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
                topRight: Radius.circular(100)),
            color: BACKGROUND_COLOR,
            shape: BoxShape.rectangle,
          ),
          height: 35,
          width: 20,
        ),
        Expanded(
          child: Text(
            '----------------------------------------------------',
            maxLines: 1,
            style: TextStyle(
              color: Colors.grey,
              fontSize: TEXT_HEADING_2X,
              letterSpacing: 10,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                topLeft: Radius.circular(100)),
            color: BACKGROUND_COLOR,
            shape: BoxShape.rectangle,
          ),
          height: 35,
          width: 20,
        ),
      ],
    );
  }
}
