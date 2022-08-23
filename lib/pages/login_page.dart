import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/pages/otp_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
              SizedBox(
                height: MARGIN_LARGE,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 100,
                      child: DropdownButtonFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        dropdownColor: Colors.black,
                        decoration: InputDecoration(
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
                        items: ['+95', '+01']
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
                    SizedBox(
                      width: MARGIN_MEDIUM_2,
                    ),
                    Flexible(
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
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
                      builder: (_) => const OtpPage(),
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
                    child: Text('Verify your Phone Number'),
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
                child: Row(
                  children: [
                    Flexible(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: MARGIN_CARD_MEDIUM),
                      child: Text(
                        'or',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: MARGIN_CARD_MEDIUM,
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
                      SizedBox(
                        width: MARGIN_MEDIUM,
                      ),
                      Text('Verify your Phone Number'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MARGIN_XXL_LARGE,
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
