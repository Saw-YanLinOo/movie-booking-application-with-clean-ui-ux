import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/data/vos/cinema_vo.dart';
import 'package:movie_app_view_layer/data/vos/facilities_vo.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

class CinemaDetail extends StatefulWidget {
  const CinemaDetail({Key? key, this.mCinema}) : super(key: key);

  final CinemaVO? mCinema;

  @override
  State<CinemaDetail> createState() => _CinemaDetailState();
}

class _CinemaDetailState extends State<CinemaDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BACKGROUND_COLOR,
        centerTitle: true,
        title: Text(
          'Cinema Details',
          style: GoogleFonts.dmSans(
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: const [
          Icon(
            Icons.star_border_rounded,
            size: MARGIN_XL_LARGE,
          ),
          SizedBox(
            width: MARGIN_MEDIUM,
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          CinemaDetailImageSection(cinemaPoster: widget.mCinema?.promoVdoUrl),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_CARD_MEDIUM,
                  vertical: MARGIN_CARD_MEDIUM,
                ),
                child: Text(
                  '${widget.mCinema?.name}',
                  style: GoogleFonts.inter(
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_CARD_MEDIUM,
                  vertical: MARGIN_CARD_MEDIUM,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Text(
                        '${widget.mCinema?.address}',
                        //'Q5H3+JPP, Corner of, Bogyoke Lann, Yangon ',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: TEXT_REGULAR_3X,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.send,
                      color: PRIMARY_COLOR,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: MARGIN_XL_LARGE,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_CARD_MEDIUM,
                  vertical: MARGIN_CARD_MEDIUM,
                ),
                child: FacilitiesSectionView(
                    facilitiesList: widget.mCinema?.facilities),
              ),
              const SizedBox(
                height: MARGIN_XL_LARGE,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_CARD_MEDIUM,
                  vertical: MARGIN_CARD_MEDIUM,
                ),
                child: SafetySection(safetyList: widget.mCinema?.safety),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class SafetySection extends StatelessWidget {
  const SafetySection({
    Key? key,
    required this.safetyList,
  }) : super(key: key);

  final List<String>? safetyList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Safety',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Wrap(
          children: safetyList
                  ?.map((e) => Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM,
                          vertical: MARGIN_SMALL,
                        ),
                        padding: const EdgeInsets.all(MARGIN_SMALL),
                        decoration: BoxDecoration(
                          color: PRIMARY_COLOR,
                          borderRadius: BorderRadius.circular(MARGIN_SMALL),
                        ),
                        child: Text(
                          e,
                          style: GoogleFonts.inter(
                            fontSize: TEXT_REGULAR,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ))
                  .toList() ??
              [],
        ),
      ],
    );
  }
}

class FacilitiesSectionView extends StatelessWidget {
  const FacilitiesSectionView({
    this.facilitiesList,
    Key? key,
  }) : super(key: key);

  final List<FacilitiesVO>? facilitiesList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Facilities',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Wrap(
          spacing: MARGIN_MEDIUM,
          children: [
            ...facilitiesList?.map(
                  (f) => FacilitiesItemView(
                    icon: Image.network(
                      '${f.img}',
                      color: PRIMARY_COLOR,
                    ),
                    title: '${f.title}',
                  ),
                ) ??
                [],
          ],
        ),
      ],
    );
  }
}

class FacilitiesItemView extends StatelessWidget {
  const FacilitiesItemView({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        SizedBox(
          width: MARGIN_SMALL,
        ),
        Text(
          title,
          style: GoogleFonts.inter(
            color: PRIMARY_COLOR,
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class CinemaDetailImageSection extends StatefulWidget {
  const CinemaDetailImageSection({
    Key? key,
    this.cinemaPoster,
  }) : super(key: key);

  final String? cinemaPoster;

  @override
  State<CinemaDetailImageSection> createState() =>
      _CinemaDetailImageSectionState();
}

class _CinemaDetailImageSectionState extends State<CinemaDetailImageSection> {
  late FlickManager flickManager;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.network('${widget.cinemaPoster}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: PROFILE_PAGE_SLIVER_APP_BAR_HEIGHT,
      backgroundColor: BACKGROUND_COLOR,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background:
            Container(child: FlickVideoPlayer(flickManager: flickManager)),

        // background: Stack(
        //   children: [
        //     // Positioned.fill(
        //     //   child: Image.asset('assets/images/cinema_image.png'),
        //     // ),
        //     Positioned.fill(
        //       child:
        // _chewieController != null &&
        //               _chewieController
        //                   .videoPlayerController.value.isInitialized
        //           ? Chewie(controller: _chewieController)
        //           : Image.asset('assets/images/cinema_image.png'),
        //     ),
        //     Align(
        //       alignment: Alignment.center,
        //       child: Container(
        //         padding: const EdgeInsets.all(10),
        //         decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           color: Colors.white.withOpacity(0.2),
        //         ),
        //         child: const Icon(
        //           Icons.play_arrow,
        //           color: Colors.white,
        //           size: MARGIN_XXL_LARGE,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flickManager.dispose();
  }
}
