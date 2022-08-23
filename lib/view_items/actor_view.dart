import 'package:flutter/material.dart';

import '../resources/dimens.dart';
import '../widgets/movie_title.dart';

class ActorView extends StatelessWidget {
  const ActorView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MOVIE_DETAIL_ACTOR_VIEW_WIDTH,
          height: MOVIE_DETAIL_ACTOR_VIEW_WIDTH,
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/movie_actor.png',
            ),
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        MovieTitle(
          title: 'Katty as Monica',
          fontWeight: FontWeight.normal,
        ),
      ],
    );
  }
}
