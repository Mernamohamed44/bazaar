import 'package:bazzar/layout/home_layout.dart';
import 'package:bazzar/modules/signin_screen.dart';
import 'package:bazzar/shared/themes.dart';
import 'package:bazzar/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('b a z a a r',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  color: CommonMethod().themeData.primaryColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ))),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'images/R.png',
              width: 250,
              height: 250,
            ),
            const SizedBox(
              height: 20,
            ),
            buildButton(
                'Take a look',
                CommonMethod().themeData.primaryColor,
                Colors.white,
                () => navigateTo(context, const HomeLayout()),
                40.0,
                300.0),
            const SizedBox(
              height: 10,
            ),
            buildButton('Sign In', null, CommonMethod().themeData.primaryColor,
                () => navigateTo(context, SignInScreen()), 40.0, 300.0)
          ],
        ),
      ),
    );
  }
}
