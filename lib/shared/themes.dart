import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CommonMethod {
  ThemeData themeData = ThemeData(
      primaryColor: HexColor('#2291FF'),
      appBarTheme: AppBarTheme(
        color: HexColor('#FFFFFF'),
      ),
      scaffoldBackgroundColor: HexColor('#DADDE1'),
      textTheme: TextTheme(
          bodyText1: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: HexColor('#0E3746'),
              fontWeight: FontWeight.w600,
                fontSize: 20
            ),
          ),
          bodyText2: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: HexColor('#FFFFFF'),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
      headline1:GoogleFonts.poppins(
        textStyle: TextStyle(
            color: HexColor('#0E3746'),
            fontWeight: FontWeight.w400,
            fontSize: 15
        ),
      ), ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: HexColor('#2291FF'),
          unselectedItemColor: HexColor('#0E3746'),
          unselectedLabelStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: HexColor('#0E3746'),
            ),
          )));
}
