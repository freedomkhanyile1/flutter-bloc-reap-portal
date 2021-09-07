
import 'package:flutter/material.dart';

// font colors here.
Color kPrimaryColor = HexColor("#e74c3c"); // ALIZARIN : #e74c3c
Color kPrimaryLightColor = HexColor("#e74c3c").withOpacity(0.5); // ALIZARIN : #e74c3c (with 50% opacity) for lighter

Color kSecondaryColor = HexColor("#2d98da"); // boy zone
Color kSecondaryLightColor = HexColor("#45aaf2"); // hight blue

Color kTextColor = HexColor("#000000");
Color kTextLightColor = HexColor("#636e72");

Color $grey = HexColor("#a4b0be");

// animation duration
const kAnimationDuration = Duration(milliseconds: 200);

const kDefaultPadding = 20.0;

// gradients
LinearGradient kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    HexColor("#a55eea"), // lighter purple
    kPrimaryColor // primary color
  ],
);


// font Size;
const double? kH1 = 32;
const double? kH2 = 25;
const double? kH3 = 18;
const double? p = 16;
const double? t = 12;

// font weight;
const FontWeight fontWeightLight = FontWeight.w400;
const FontWeight fontWeightMedium = FontWeight.w500;
const FontWeight fontWeightSemiBold = FontWeight.w600;
const FontWeight fontWeightBold = FontWeight.w700;

// Takes a #hexcode and converts it to an android/ios color code.
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}