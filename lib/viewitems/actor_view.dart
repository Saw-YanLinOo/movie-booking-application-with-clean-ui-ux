import 'package:flutter/material.dart';
import 'package:movie_app_view_layer/data/vos/credit_vo.dart';
import 'package:movie_app_view_layer/network/api_constants.dart';

import '../resources/dimens.dart';
import '../widgets/movie_title.dart';

class ActorView extends StatelessWidget {
  const ActorView({
    Key? key,
    this.creditVO,
  }) : super(key: key);

  final CreditVO? creditVO;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MOVIE_DETAIL_ACTOR_VIEW_WIDTH,
          height: MOVIE_DETAIL_ACTOR_VIEW_WIDTH,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              '$IMAGE_BASE_URL${creditVO?.profilePath}',
            ),
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        MovieTitle(
          title: '${creditVO?.name}',
          fontWeight: FontWeight.normal,
        ),
      ],
    );
  }
}
