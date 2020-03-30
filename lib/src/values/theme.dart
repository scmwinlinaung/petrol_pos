import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final darkTheme = ThemeData(
    // primarySwatch: Colors.lightBlue,
    primaryColor: Colors.black,
    accentColor: Colors.black,
    fontFamily: 'NotoSans',
    textTheme: GoogleFonts.notoSansTextTheme().copyWith(
      headline: TextStyle(fontSize: 16.0),
      body2: TextStyle(fontSize: 30.0, color: Colors.white),
      title: TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      body1: TextStyle(fontSize: 16, color: Colors.black),
    ),
    buttonColor: Colors.black,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black,
    ));

final lightTheme = ThemeData(
    // primarySwatch: Colors.lightBlue,
    primaryColor: Colors.lightBlue,
    accentColor: Colors.lightBlueAccent,
    fontFamily: 'NotoSans',
    textTheme: GoogleFonts.notoSansTextTheme().copyWith(
      headline: TextStyle(fontSize: 16.0),
      body2: TextStyle(fontSize: 30.0, color: Colors.white),
      title: TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      body1: TextStyle(fontSize: 16, color: Colors.black),
    ),
    buttonTheme: ButtonThemeData(buttonColor: Colors.lightBlue));
