import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/resources/colors.dart';

import '../resources/dimens.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = 'Purchae History';
    Widget icon = Icon(
      Icons.history,
    );
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: CustomScrollView(
        slivers: [
          ProfileAppBarSection(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MARGIN_CARD_MEDIUM,
                    ),
                    ProfileListItemView(
                      title: 'Purchae History',
                      icon: Icon(
                        Icons.history,
                        color: Colors.white,
                      ),
                    ),
                    ProfileListItemView(
                      title: 'Offer',
                      icon: Image.asset(
                        'assets/icons/promo_code_icon.png',
                        color: Colors.white,
                      ),
                    ),
                    ProfileListItemView(
                      title: 'Gift Card',
                      icon: Image.asset(
                        'assets/icons/gift_icon.png',
                        color: Colors.white,
                      ),
                    ),
                    ProfileListItemView(
                      title: 'Location',
                      icon: Icon(
                        Icons.location_on,
                        size: MARGIN_XL_LARGE,
                        color: Colors.white,
                      ),
                    ),
                    ProfileListItemView(
                      title: 'Payment',
                      icon: Icon(
                        Icons.payment,
                        size: MARGIN_XL_LARGE,
                        color: Colors.white,
                      ),
                    ),
                    ProfileListItemView(
                      title: 'Help And Support',
                      icon: Image.asset(
                        'assets/icons/help_icon.png',
                        color: Colors.white,
                      ),
                    ),
                    ProfileListItemView(
                      title: 'Logout',
                      icon: Icon(
                        Icons.logout,
                        size: MARGIN_XL_LARGE,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class ProfileListItemView extends StatelessWidget {
  const ProfileListItemView({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: icon,
          title: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ),
        Divider(
          color: Colors.grey.withOpacity(0.5),
        ),
      ],
    );
  }
}

class ProfileAppBarSection extends StatelessWidget {
  const ProfileAppBarSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: PROFILE_PAGE_SLIVER_APP_BAR_HEIGHT,
      backgroundColor: BACKGROUND_COLOR,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/images/profile_background.png'),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/icons/profile_froceground_icon.png'),
                  SizedBox(
                    height: MARGIN_MEDIUM_3,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                        side: BorderSide(
                          color: PRIMARY_COLOR,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Login or Sign Up',
                      style: GoogleFonts.inter(
                        fontSize: TEXT_REGULAR_3X,
                        fontWeight: FontWeight.w600,
                        color: PRIMARY_COLOR,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.only(
            //         top: MARGIN_XXL_LARGE, left: MARGIN_MEDIUM_2),
            //     child: BackButtonView(() {
            //       onTapBack();
            //     }),
            //   ),
            // ),
            // const Align(
            //   alignment: Alignment.topRight,
            //   child: Padding(
            //     padding: EdgeInsets.only(
            //         top: MARGIN_XXL_LARGE + MARGIN_MEDIUM,
            //         right: MARGIN_MEDIUM_2),
            //     child: SearchButtonView(),
            //   ),
            // ),
            // const Align(
            //   alignment: Alignment.bottomLeft,
            //   child: Padding(
            //     padding: EdgeInsets.only(
            //       left: MARGIN_MEDIUM_2,
            //       right: MARGIN_MEDIUM_2,
            //       bottom: MARGIN_LARGE,
            //     ),
            //     child: MovieDetailsAppBarInfoView(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
