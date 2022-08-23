import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/pages/checkot_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';

import '../resources/strings.dart';
import '../view_items/food_view.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const foodList = [
      'All',
      'Combo',
      'Snack',
      'Pop Corn',
      'Beverge',
    ];
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BACKGROUND_COLOR,
        title: Text(
          GRAB_A_BITE_TEXT,
          style: GoogleFonts.dmSans(
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
          ),
          SizedBox(
            width: MARGIN_XL_LARGE,
          ),
          Center(
            child: Text(
              FOOD_PAGE_SKIP_TEXT,
              style: GoogleFonts.inter(
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: MARGIN_MEDIUM_2,
          ),
        ],
      ),
      body: DefaultTabController(
        length: foodList.length,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_2,
              ),
              child: FoodTitleSectionView(foodList: foodList),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: MARGIN_LARGE,
                  right: MARGIN_LARGE,
                  top: MARGIN_XL_LARGE,
                ),
                child: FoodGridSectionView(foodList: foodList),
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        TotalSectionView(
          onTapToOpen: () {
            _showModelButtonSheet(context);
          },
          toCheckOut: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CheckOutPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  _showModelButtonSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: BACKGROUND_COLOR,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 4,
                  padding: const EdgeInsets.symmetric(
                      horizontal: MARGIN_MEDIUM_2, vertical: MARGIN_MEDIUM),
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Large Cola',
                          style: GoogleFonts.inter(
                              fontSize: TEXT_REGULAR_2X,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add_circle,
                              color: PRIMARY_COLOR,
                            ),
                            SizedBox(
                              width: MARGIN_MEDIUM,
                            ),
                            Text(
                              '1',
                              style: GoogleFonts.inter(
                                  fontSize: TEXT_REGULAR_2X,
                                  fontWeight: FontWeight.w700,
                                  color: PRIMARY_COLOR),
                            ),
                            SizedBox(
                              width: MARGIN_MEDIUM,
                            ),
                            Icon(
                              Icons.do_disturb_on,
                              color: PRIMARY_COLOR,
                            ),
                          ],
                        ),
                        Text(
                          '1000 KS',
                          style: GoogleFonts.inter(
                              fontSize: TEXT_REGULAR_2X,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: MARGIN_CARD_MEDIUM,
                    );
                  },
                ),
              ),
              TotalSectionView(
                onTapToOpen: () {
                  Navigator.pop(context);
                },
                toCheckOut: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CheckOutPage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_drop_up_rounded,
                ),
              ),
            ],
          );
        });
  }
}

class TotalSectionView extends StatelessWidget {
  final Function toCheckOut;
  final Function onTapToOpen;
  final Icon? icon;

  const TotalSectionView({
    required this.toCheckOut,
    required this.onTapToOpen,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        MARGIN_CARD_MEDIUM_2,
      ),
      width: MediaQuery.of(context).size.width,
      height: MARGIN_XXL_LARGE,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: PRIMARY_COLOR,
        borderRadius: BorderRadius.circular(
          MARGIN_MEDIUM,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: MARGIN_LARGE,
            ),
            child: InkWell(
              onTap: () {
                onTapToOpen();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.fastfood_outlined,
                  ),
                  SizedBox(
                    width: MARGIN_SMALL,
                  ),
                  icon ??
                      const Icon(
                        Icons.arrow_drop_down,
                      ),
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              right: MARGIN_LARGE,
            ),
            child: GestureDetector(
              onTap: () {
                toCheckOut();
              },
              child: Row(
                children: [
                  Text(
                    '2000 KS',
                    style: GoogleFonts.inter(
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: MARGIN_SMALL,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: MARGIN_MEDIUM_2,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FoodGridSectionView extends StatelessWidget {
  const FoodGridSectionView({
    Key? key,
    required this.foodList,
  }) : super(key: key);

  final List<String> foodList;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: foodList.map((e) {
        return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3.1,
              mainAxisSpacing: MARGIN_LARGE,
              crossAxisSpacing: MARGIN_LARGE,
            ),
            itemCount: 10,
            itemBuilder: (context, invex) {
              return FoodView();
            });
      }).toList(),
    );
  }
}

class FoodTitleSectionView extends StatelessWidget {
  const FoodTitleSectionView({
    Key? key,
    required this.foodList,
  }) : super(key: key);

  final List<String> foodList;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      indicatorColor: PRIMARY_COLOR,
      tabs: foodList
          .map((e) => Tab(
                child: Text(
                  e,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: MARGIN_MEDIUM_2,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
