import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/data/models/movie_model.dart';
import 'package:movie_app_view_layer/data/models/movie_model_impl.dart';
import 'package:movie_app_view_layer/data/vos/check_out_data_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_category_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_operation_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_vo.dart';
import 'package:movie_app_view_layer/pages/checkot_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';

import '../data/vos/cinema_vo.dart';
import '../resources/strings.dart';
import '../viewitems/food_view.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key, this.mCinema, this.checkOutData}) : super(key: key);
  final CheckOutDataVO? checkOutData;
  final CinemaVO? mCinema;
  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  MovieModel mMovieModel = MovieModelImpl();

  List<SnackCategoryVO>? snackCategoryList;
  List<SnackVO>? snackList;
  SnackOperationVO oSnack = SnackOperationVO();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mMovieModel.getSnackCategoryFromDatabase().listen((categoryList) {
      snackCategoryList = categoryList;
      snackCategoryList?.insert(0, SnackCategoryVO(title: 'All'));
      setState(() {});
    });
    _getSnack(0);
  }

  _getSnack(int categoryId) {
    // Network
    // mMovieModel.getSnack('$categoryId').then((snacks) {
    //   snackList = snacks;
    //   setState(() {});
    // });
    //Database
    mMovieModel.getSnackByCatIdFromDatabase(categoryId).listen((snacks) {
      snackList = snacks;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: snackCategoryList == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: MARGIN_MEDIUM_2,
                  ),
                  child: FoodTitleSectionView(
                    onTapCategory: (value) {
                      _getSnack(value);
                    },
                    categoryList: snackCategoryList,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: MARGIN_LARGE,
                      right: MARGIN_LARGE,
                      top: MARGIN_XL_LARGE,
                    ),
                    child: FoodGridSectionView(
                      foodList: snackList,
                      onTapAdd: (snack) {
                        oSnack.addSnack(snack);
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
      persistentFooterButtons: [
        TotalSectionView(
          onTapToOpen: () {
            _showModelButtonSheet(context, oSnack);
          },
          toCheckOut: () {
            widget.checkOutData?.mSnacks = oSnack;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CheckOutPage(checkOutData: widget.checkOutData),
              ),
            );
          },
          totalPrice: oSnack.totalPrice,
        ),
      ],
    );
  }

  _showModelButtonSheet(BuildContext context, SnackOperationVO oSnack) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: BACKGROUND_COLOR,
      builder: (context) {
        return FoodButtonSheetView(
          oSnack: oSnack,
          checkOutData: widget.checkOutData,
        );
      },
    );

    setState(() {});
  }
}

class FoodButtonSheetView extends StatefulWidget {
  const FoodButtonSheetView({
    required this.oSnack,
    this.checkOutData,
    Key? key,
  }) : super(key: key);

  final SnackOperationVO oSnack;
  final CheckOutDataVO? checkOutData;
  @override
  State<FoodButtonSheetView> createState() => _FoodButtonSheetViewState();
}

class _FoodButtonSheetViewState extends State<FoodButtonSheetView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: widget.oSnack.snackList.length,
            padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_2, vertical: MARGIN_MEDIUM),
            itemBuilder: (context, index) {
              var snack = widget.oSnack.snackList[index];
              var qty = snack.quantity ?? 0;
              var subPrice = snack.price ?? 0;
              var subTotal = qty * subPrice;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      '${snack.name}',
                      style: GoogleFonts.inter(
                        fontSize: TEXT_REGULAR_2X,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.oSnack.addSnack(snack);
                          setState(() {});
                        },
                        child: Icon(
                          Icons.add_circle,
                          color: PRIMARY_COLOR,
                        ),
                      ),
                      SizedBox(
                        width: MARGIN_MEDIUM,
                      ),
                      Text(
                        '${snack.quantity}',
                        style: GoogleFonts.inter(
                            fontSize: TEXT_REGULAR_2X,
                            fontWeight: FontWeight.w700,
                            color: PRIMARY_COLOR),
                      ),
                      SizedBox(
                        width: MARGIN_MEDIUM,
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.oSnack.reduceSnack(snack);
                          setState(() {});
                        },
                        child: Icon(
                          Icons.do_disturb_on,
                          color: PRIMARY_COLOR,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '$subTotal KS',
                    style: GoogleFonts.inter(
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
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
            widget.checkOutData?.mSnacks = widget.oSnack;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CheckOutPage(checkOutData: widget.checkOutData),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_drop_up_rounded,
          ),
          totalPrice: widget.oSnack.totalPrice,
        ),
      ],
    );
  }
}

class TotalSectionView extends StatelessWidget {
  final Function toCheckOut;
  final Function onTapToOpen;
  final Icon? icon;
  final int? totalPrice;
  const TotalSectionView({
    required this.toCheckOut,
    required this.onTapToOpen,
    this.icon,
    this.totalPrice,
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
                    '$totalPrice KS',
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
    this.foodList,
    required this.onTapAdd,
  }) : super(key: key);

  final List<SnackVO>? foodList;
  final Function(SnackVO) onTapAdd;
  @override
  Widget build(BuildContext context) {
    return foodList == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3.1,
              mainAxisSpacing: MARGIN_LARGE,
              crossAxisSpacing: MARGIN_LARGE,
            ),
            itemCount: foodList?.length,
            itemBuilder: (context, index) {
              var snack = foodList?[index];
              return FoodView(
                snack: snack,
                onTapAdd: () {
                  onTapAdd(snack!);
                },
              );
            },
          );
  }
}

class FoodTitleSectionView extends StatelessWidget {
  const FoodTitleSectionView({
    Key? key,
    this.categoryList,
    required this.onTapCategory,
  }) : super(key: key);

  final List<SnackCategoryVO>? categoryList;
  final Function(int) onTapCategory;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categoryList?.length ?? 0,
      child: TabBar(
        onTap: (value) {
          onTapCategory(value);
        },
        isScrollable: true,
        indicatorColor: PRIMARY_COLOR,
        tabs: categoryList
                ?.map(
                  (c) => Tab(
                    child: Text(
                      '${c.title}',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: MARGIN_MEDIUM_2,
                      ),
                    ),
                  ),
                )
                .toList() ??
            [],
      ),
    );
  }
}
