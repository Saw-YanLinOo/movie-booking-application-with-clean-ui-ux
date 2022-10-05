import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/data/vos/check_out_data_vo.dart';
import 'package:movie_app_view_layer/data/vos/cinema_vo.dart';
import 'package:movie_app_view_layer/data/vos/movie_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_operation_vo.dart';
import 'package:movie_app_view_layer/widgets/icon.dart';

import '../data/vos/snack_vo.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../widgets/divider_widget.dart';
import 'date_item_view.dart';

class CheckOutTicketView extends StatefulWidget {
  const CheckOutTicketView({
    Key? key,
    this.checkOutData,
  }) : super(key: key);

  final CheckOutDataVO? checkOutData;

  @override
  State<CheckOutTicketView> createState() => _CheckOutTicketViewState();
}

class _CheckOutTicketViewState extends State<CheckOutTicketView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CHECKOUT_GRADIENT_COLOR_ONE,
            CHECKOUT_GRADIENT_COLOR_TWO,
            CHECKOUT_GRADIENT_COLOR_ONE,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MARGIN_MEDIUM_3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
            child: MovieTitleView(movie: widget.checkOutData?.mMovie),
          ),
          SizedBox(
            height: MARGIN_CARD_MEDIUM,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
            child: CenimaInfoSection(cinema: widget.checkOutData?.mCinema),
          ),
          SizedBox(
            height: MARGIN_MEDIUM_3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
            child: DateSectionView(),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
            child: TicketInfoSection(),
          ),
          SizedBox(
            height: MARGIN_CARD_MEDIUM_2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
            child: FoodSection(
              onTapCancel: (snack) {
                widget.checkOutData?.mSnacks?.reduceSnack(snack);
                setState(() {});
              },
              oSnack: widget.checkOutData?.mSnacks,
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          DividerWidget(),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
            child: AdditionalFeeSection(),
          ),
          SizedBox(
            height: MARGIN_MEDIUM_2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
            child: PolicyView(() {
              _showPolicyDialog(context);
            }),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
            child: TotalView(checkOutDat: widget.checkOutData),
          ),
          SizedBox(
            height: MARGIN_MEDIUM_2,
          ),
        ],
      ),
    );
  }
}

void _showPolicyDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: BACKGROUND_COLOR,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Terms and Conditions',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: MARGIN_CARD_MEDIUM_2,
            ),
            Row(
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: MARGIN_MEDIUM_2,
                ),
                Text(
                  '100% Refund on F&B',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MARGIN_CARD_MEDIUM,
            ),
            Row(
              children: [
                CustomIcon(
                  image: 'assets/icons/ticket_icon.png',
                  color: Colors.white,
                ),
                SizedBox(
                  width: MARGIN_MEDIUM_2,
                ),
                Text(
                  'Up to 75% Refund for Tickets',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MARGIN_MEDIUM_2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: MARGIN_XL_LARGE),
              child: Text(
                '-75% refund until 2 hours before show start time',
                style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontSize: TEXT_REGULAR,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: MARGIN_MEDIUM,
            ),
            Padding(
              padding: const EdgeInsets.only(left: MARGIN_XL_LARGE),
              child: Text(
                '-50% refund between 2 hours and 20 minutes before show start time',
                style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontSize: TEXT_REGULAR,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: MARGIN_LARGE,
            ),
            Text(
              '1. Refund not available for Convenience fees,Vouchers, Gift Cards, Taxes etc.',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: MARGIN_MEDIUM,
            ),
            Text(
              '2.  No cancelation within 20minute of show start time.',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: MARGIN_CARD_MEDIUM,
            ),
            Center(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    PRIMARY_COLOR,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Accept",
                  style: GoogleFonts.inter(
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class MovieTitleView extends StatelessWidget {
  const MovieTitleView({
    Key? key,
    this.movie,
  }) : super(key: key);

  final MovieVO? movie;
  @override
  Widget build(BuildContext context) {
    return Text(
      '${movie?.title}',
      //'Black Widow (3D) (U/A)',
      style: GoogleFonts.dmSans(
        fontSize: TEXT_REGULAR_2X,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }
}

class CenimaInfoSection extends StatelessWidget {
  const CenimaInfoSection({
    Key? key,
    this.cinema,
  }) : super(key: key);

  final CinemaVO? cinema;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: '${cinema?.name}',
            //text: 'JCGV : Junction City',
            style: GoogleFonts.dmSans(
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w400,
              color: PRIMARY_COLOR,
            ),
          ),
          TextSpan(
            text: '(SCREEN ${cinema?.timeSlot?.status})',
            style: GoogleFonts.dmSans(
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class PolicyView extends StatelessWidget {
  final Function onTapPolicy;

  const PolicyView(
    this.onTapPolicy, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapPolicy();
      },
      child: Chip(
        avatar: Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        label: Text(
          'Ticket Cancelion policy',
          style: GoogleFonts.dmSans(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: TEXT_REGULAR,
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 107, 0, 1),
      ),
    );
  }
}

class TotalView extends StatelessWidget {
  const TotalView({
    Key? key,
    this.checkOutDat,
  }) : super(key: key);

  final CheckOutDataVO? checkOutDat;
  @override
  Widget build(BuildContext context) {
    final snackPrice = checkOutDat?.mSnacks?.totalPrice ?? 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total',
          style: GoogleFonts.inter(
              fontSize: TEXT_REGULAR_3X,
              fontWeight: FontWeight.w700,
              color: PRIMARY_COLOR),
        ),
        Text(
          '${snackPrice + 20000 + 500}Ks',
          style: GoogleFonts.inter(
              fontSize: TEXT_REGULAR_3X,
              fontWeight: FontWeight.w700,
              color: PRIMARY_COLOR),
        ),
      ],
    );
  }
}

class AdditionalFeeSection extends StatelessWidget {
  const AdditionalFeeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(children: <InlineSpan>[
            TextSpan(
              text: 'Convenience Fee',
              style: GoogleFonts.dmSans(
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            WidgetSpan(
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            )
          ]),
        ),
        Text(
          '500Ks',
          style: GoogleFonts.dmSans(
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class FoodSection extends StatelessWidget {
  const FoodSection({
    Key? key,
    this.oSnack,
    required this.onTapCancel,
  }) : super(key: key);

  final SnackOperationVO? oSnack;
  final Function(SnackVO) onTapCancel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  color: Colors.white,
                  size: MARGIN_LARGE,
                ),
                SizedBox(
                  width: MARGIN_SMALL,
                ),
                Text.rich(
                  TextSpan(children: <InlineSpan>[
                    TextSpan(
                      text: 'Food and Beverage',
                      style: GoogleFonts.dmSans(
                          fontSize: TEXT_REGULAR_2X,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    WidgetSpan(
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    )
                  ]),
                ),
              ],
            ),
            Text(
              '${oSnack?.totalPrice}Ks',
              //'20000ks',
              style: GoogleFonts.dmSans(
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          height: MARGIN_CARD_MEDIUM_2,
        ),
        ...oSnack?.snackList
                .map(
                  (snack) => Padding(
                    padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
                    child: FoodItemView(
                      onTapCancel: () {
                        onTapCancel(snack);
                      },
                      title: '${snack.name} (Qt. ${snack.quantity})',
                      price: '${(snack.price ?? 0) * (snack.quantity ?? 0)}ks',
                    ),
                  ),
                )
                .toList() ??
            [],
      ],
    );
  }
}

class FoodItemView extends StatelessWidget {
  const FoodItemView({
    Key? key,
    required this.title,
    required this.price,
    required this.onTapCancel,
  }) : super(key: key);

  final String title;
  final String price;
  final Function onTapCancel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                onTapCancel();
              },
              child: Icon(
                Icons.cancel,
                color: PRIMARY_COLOR,
              ),
            ),
            SizedBox(
              width: MARGIN_SMALL,
            ),
            Text(
              title,
              style: GoogleFonts.dmSans(
                  fontSize: TEXT_REGULAR,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey),
            ),
          ],
        ),
        Text(
          price,
          style: GoogleFonts.dmSans(
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w700,
              color: Colors.grey),
        ),
      ],
    );
  }
}

class TicketInfoSection extends StatelessWidget {
  const TicketInfoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TotalTicketView(),
        SizedBox(
          height: MARGIN_CARD_MEDIUM,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Gold-G8,G7',
              style: GoogleFonts.dmSans(
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              '20000Ks',
              style: GoogleFonts.dmSans(
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TotalTicketView extends StatelessWidget {
  const TotalTicketView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: 'M-Ticket(',
            style: GoogleFonts.dmSans(
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          TextSpan(
            text: '2',
            style: GoogleFonts.dmSans(
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w400,
              color: PRIMARY_COLOR,
            ),
          ),
          TextSpan(
            text: ')',
            style: GoogleFonts.dmSans(
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
