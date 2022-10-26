import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/data/models/movie_model.dart';
import 'package:movie_app_view_layer/data/models/movie_model_impl.dart';
import 'package:movie_app_view_layer/data/vos/check_out_data_vo.dart';
import 'package:movie_app_view_layer/data/vos/payment_vo.dart';
import 'package:movie_app_view_layer/network/requests/check_out_request.dart';
import 'package:movie_app_view_layer/pages/confirmation_page.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';
import 'package:movie_app_view_layer/resources/strings.dart';

import '../resources/colors.dart';
import '../widgets/checkout_title.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key, this.checkOutData}) : super(key: key);

  final CheckOutDataVO? checkOutData;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  MovieModel mMovieModel = MovieModelImpl();

  List<PaymentVO>? mPyament;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Network
    // mMovieModel.getPaymentType().then((pList) {
    //   mPyament = pList;
    //   setState(() {});
    // });

    // Database
    mMovieModel.getPaymentTypeFromDatabase().listen((pList) {
      mPyament = pList;
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
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        centerTitle: true,
        title: const CheckOutTitle(title: PAYMENT_TEXT),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: MARGIN_CARD_MEDIUM,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_XXL_LARGE),
            child: PromoCodeSection(),
          ),
          const SizedBox(
            height: MARGIN_XL_LARGE,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CHOOSE_YOUR_PAYMENT_TYPE_TEXT,
                  style: GoogleFonts.dmSans(
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w700,
                    color: PRIMARY_COLOR,
                  ),
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM_3,
                ),
                mPyament == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: mPyament?.length ?? 0,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final p = mPyament?[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: MARGIN_CARD_MEDIUM,
                            ),
                            child: PaymentView(
                              text: '${p?.title}',
                              icon: Image.network('${p?.icon}'),
                              onTapPayment: () {
                                _checkOut(context, p);
                              },
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _checkOut(BuildContext context, PaymentVO? payment) {
    final checkOutRequest = CheckOutRequest(
      seatNumber: 'N-8',
      bookingDate: '${widget.checkOutData?.selectDate}',
      cinemaDayTimeSlotId: widget.checkOutData?.mCinema?.timeSlot?.id,
      movieId: widget.checkOutData?.mMovie?.id,
      paymentTypeId: payment?.id,
      stacks: widget.checkOutData?.mSnacks?.snackList,
    );

    mMovieModel.checkOut(checkOutRequest).then((checkOut) {
      if (checkOut.code == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ConfirmationPage(
              checkOut: checkOut.data,
              checkOutData: widget.checkOutData,
            ),
          ),
        );
      }
    });
  }
}

class PaymentView extends StatelessWidget {
  const PaymentView({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTapPayment,
  }) : super(key: key);

  final Widget icon;
  final String text;
  final Function onTapPayment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTapPayment();
      },
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(MARGIN_CARD_MEDIUM_2),
      ),
      leading: icon,
      title: Text(
        text,
        style: GoogleFonts.dmSans(
          fontSize: TEXT_REGULAR,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
    );
  }
}

class PromoCodeSection extends StatelessWidget {
  const PromoCodeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          cursorColor: PRIMARY_COLOR,
          style: const TextStyle(color: Colors.grey),
          decoration: InputDecoration(
            hintText: 'Enter your name',
            hintStyle: const TextStyle(color: Colors.grey),
            labelText: 'Your Name',
            labelStyle: const TextStyle(color: PRIMARY_COLOR),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
              borderSide: const BorderSide(
                color: PRIMARY_COLOR,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
              borderSide: const BorderSide(
                color: PRIMARY_COLOR,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: MARGIN_XL_LARGE,
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: PRIMARY_COLOR,
            padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_LARGE, vertical: MARGIN_CARD_MEDIUM_2),
          ),
          onPressed: () {},
          icon: Image.asset('assets/icons/promo_code_icon.png'),
          label: Text(
            'Unlock Offer or Apply Promocode',
            style: GoogleFonts.dmSans(
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
