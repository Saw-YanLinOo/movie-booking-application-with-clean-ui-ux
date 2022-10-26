import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/data/models/movie_model.dart';
import 'package:movie_app_view_layer/data/models/movie_model_impl.dart';
import 'package:movie_app_view_layer/pages/location_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key, required this.phone}) : super(key: key);

  final String phone;
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  MovieModel mMovieModel = MovieModelImpl();

  final TextEditingController _otpController = TextEditingController();

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
              HeadingSeaction(),
              SizedBox(
                height: MARGIN_XL_LARGE,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                ),
                child: InputOtp(otpController: _otpController),
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: MARGIN_MEDIUM_2,
                ),
                child: ComfirmOtpButton(
                  onPressed: () {
                    _confirmOtp(context, _otpController.text);
                  },
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

  _confirmOtp(BuildContext context, String otp) {
    mMovieModel.signInWithPhone(widget.phone, otp).then((response) {
      if (response.code == 201) {
        debugPrint('success ::: ${response.toJson()}');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const LocationPage(),
          ),
        );
      }
    });
  }
}

class InputOtp extends StatelessWidget {
  const InputOtp({
    Key? key,
    required TextEditingController otpController,
  })  : _otpController = otpController,
        super(key: key);

  final TextEditingController _otpController;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          controller: _otpController,
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
    );
  }
}

class ComfirmOtpButton extends StatelessWidget {
  const ComfirmOtpButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
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
    );
  }
}

class HeadingSeaction extends StatelessWidget {
  const HeadingSeaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
