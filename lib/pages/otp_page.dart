import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/pages/location_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BACKGROUND_COLOR,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/icons/logo_icon.png',
                fit: BoxFit.fill,
                width: 124,
                height: 150,
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              Text(
                "We've send OTP Code",
                style: GoogleFonts.dmSans(
                  fontSize: TEXT_REGULAR_3X,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  'Please enter 6-digit OTP code that sent to your phone number.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: MARGIN_XL_LARGE,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter OTP Code',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: MARGIN_MEDIUM,
                    ),
                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        inactiveFillColor: Colors.white,
                        inactiveColor: Colors.white,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: BACKGROUND_COLOR,
                      enableActiveFill: true,
                      onCompleted: (v) {
                        print("Completed");
                      },
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MARGIN_XL_LARGE,
              ),
              Text(
                'Don’t receive OTP? Resend Code',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: MARGIN_XL_LARGE,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LocationPage(),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(
                    horizontal: MARGIN_MEDIUM_3,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: MARGIN_MEDIUM_2,
                  ),
                  decoration: BoxDecoration(
                    color: PRIMARY_COLOR,
                    borderRadius: BorderRadius.circular(
                      MARGIN_MEDIUM,
                    ),
                  ),
                  child: Center(
                    child: Text('Comfirm OTP'),
                  ),
                ),
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                ),
                child: Text(
                  'By clicking, I accept the Terms & Conditions & Privacy Plolicy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
