import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/data/models/movie_model.dart';
import 'package:movie_app_view_layer/data/models/movie_model_impl.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';

import 'otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  MovieModel mMovieModel = MovieModelImpl();

  final TextEditingController _phoneController = TextEditingController();
  final phoneList = ['+95', '+01'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: BACKGROUND_COLOR,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeaderSection(),
              const SizedBox(
                height: MARGIN_LARGE,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                ),
                child: InputAndVerifySection(
                    phoneList: phoneList, phoneController: _phoneController),
              ),
              const SizedBox(
                height: MARGIN_XL_LARGE,
              ),
              VerifyPhoneNumber(
                onPressed: () {
                  _getOtp(context, _phoneController.text);
                },
              ),
              const SizedBox(
                height: MARGIN_LARGE,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                ),
                child: OrDivider(),
              ),
              const SizedBox(
                height: MARGIN_LARGE,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: MARGIN_CARD_MEDIUM,
                ),
                child: ContinueWithGoogleButton(onPressed: () {}),
              ),
              const SizedBox(
                height: MARGIN_XXL_LARGE,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
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

  _getOtp(BuildContext context, String phone) {
    mMovieModel.getOtp(phone).then((result) {
      if (result.code == 200) {
        debugPrint('success ::: ${result.toJson()}');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OtpPage(
              phone: phone,
            ),
          ),
        );
      }
    });
  }
}

class InputAndVerifySection extends StatelessWidget {
  const InputAndVerifySection({
    Key? key,
    required this.phoneList,
    required TextEditingController phoneController,
  })  : _phoneController = phoneController,
        super(key: key);

  final List<String> phoneList;
  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 100,
          child: DropdownButtonFormField(
            style: const TextStyle(
              color: Colors.white,
            ),
            dropdownColor: Colors.black,
            decoration: const InputDecoration(
              labelText: 'Country Code',
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
            value: '+95',
            items: phoneList
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {},
          ),
        ),
        const SizedBox(
          width: MARGIN_MEDIUM_2,
        ),
        Flexible(
          child: TextField(
            controller: _phoneController,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: const InputDecoration(
              hintText: 'Mobile number',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/logo_icon.png',
          fit: BoxFit.fill,
          width: 124,
          height: 150,
        ),
        const SizedBox(
          height: MARGIN_LARGE,
        ),
        Text(
          'Verify your Phone Number',
          style: GoogleFonts.dmSans(
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Text(
            'We will send 6-digit sms code to verify your phone number',
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

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          child: Divider(
            color: Colors.grey,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_CARD_MEDIUM),
          child: Text(
            'or',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const Flexible(
          child: Divider(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class ContinueWithGoogleButton extends StatelessWidget {
  const ContinueWithGoogleButton({
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
          vertical: MARGIN_MEDIUM,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            MARGIN_MEDIUM,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/icons/google_icon.png'),
              const SizedBox(
                width: MARGIN_MEDIUM,
              ),
              const Text('Continue With Google'),
            ],
          ),
        ),
      ),
    );
  }
}

class VerifyPhoneNumber extends StatelessWidget {
  const VerifyPhoneNumber({
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
        child: const Center(
          child: Text('Verify your Phone Number'),
        ),
      ),
    );
  }
}
