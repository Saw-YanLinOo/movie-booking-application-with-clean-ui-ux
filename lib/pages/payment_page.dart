import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/pages/confirmation_page.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';
import 'package:movie_app_view_layer/resources/strings.dart';

import '../resources/colors.dart';
import '../widgets/checkout_title.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BACKGROUND_COLOR,
        leading: const Icon(
          Icons.arrow_back_ios,
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
                PaymentView(
                  text: UPI_TEXT,
                  icon: Image.asset('assets/icons/upi_icon.png'),
                  onTapPayment: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ConfirmationPage()));
                  },
                ),
                const SizedBox(
                  height: MARGIN_CARD_MEDIUM,
                ),
                PaymentView(
                  text: GIFT_VOUCHER_TECT,
                  icon: Image.asset(
                    'assets/icons/gift_icon.png',
                    color: Colors.white,
                  ),
                  onTapPayment: () {},
                ),
                const SizedBox(
                  height: MARGIN_CARD_MEDIUM,
                ),
                PaymentView(
                  text: QUICK_PAY_TEXT,
                  icon: Image.asset('assets/icons/pay_icon.png'),
                  onTapPayment: () {},
                ),
                const SizedBox(
                  height: MARGIN_CARD_MEDIUM,
                ),
                PaymentView(
                  text: CREDIT_AND_DEBIT_TEXT,
                  icon: Image.asset(
                    'assets/icons/card_icon.png',
                    color: Colors.white,
                  ),
                  onTapPayment: () {},
                ),
                const SizedBox(
                  height: MARGIN_CARD_MEDIUM,
                ),
                PaymentView(
                  text: REDEEM_POINT_TEXT,
                  icon: Image.asset(
                    'assets/icons/redeem_point_icon.png',
                    color: Colors.white,
                  ),
                  onTapPayment: () {},
                ),
                const SizedBox(
                  height: MARGIN_CARD_MEDIUM,
                ),
                PaymentView(
                  text: MOBILE_WALLET_TEXT,
                  icon: Image.asset(
                    'assets/icons/m_wallet_icon.png',
                    color: Colors.white,
                  ),
                  onTapPayment: () {},
                ),
                const SizedBox(
                  height: MARGIN_CARD_MEDIUM,
                ),
                PaymentView(
                  text: NET_BANKING_TEXT,
                  icon: Image.asset(
                    'assets/icons/net_banking_icon.png',
                    color: Colors.white,
                  ),
                  onTapPayment: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
