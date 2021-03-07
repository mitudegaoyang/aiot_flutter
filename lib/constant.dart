import 'package:flutter/material.dart';

// Colors
const kBackgroundColor = Color.fromRGBO(245, 246, 249, 1);
const kAccentBlueColor = Color.fromRGBO(73, 83, 237, 1);
const kAccentRedColor = Color.fromRGBO(245, 46, 99, 1);
const kNeutralDarkBlueColor = Color.fromRGBO(2, 1, 14, 1);
const kNeutralGrayColor100 = Color.fromRGBO(144, 144, 154, 1);
const kNeutralGrayColor50 = Color.fromRGBO(192, 192, 199, 1);

const kPrimaryGradient = LinearGradient(
  begin: Alignment(1.18, 0.0),
  end: Alignment(-1.3, 0.0),
  colors: [const Color(0xff6d0bbd), const Color(0xff445ff5)],
  stops: [0.0, 1.0],
);
const kSemanticRedGradient = LinearGradient(
  begin: Alignment(-0.8229745030403137, 0),
  end: Alignment(0, -0.8229745030403137),
  colors: [
    Color.fromRGBO(255, 166, 105, 1),
    Color.fromRGBO(252, 71, 71, 1),
  ],
);
const kSemanticGreenGradient = LinearGradient(
  begin: Alignment(-0.8229745030403137, 0),
  end: Alignment(0, -0.8229745030403137),
  colors: [
    Color.fromRGBO(162, 236, 85, 1),
    Color.fromRGBO(31, 239, 189, 1),
  ],
);
const kSemanticBlueGradient = LinearGradient(
  begin: Alignment(-0.8229745030403137, 0),
  end: Alignment(0, -0.8229745030403137),
  colors: [
    Color.fromRGBO(86, 247, 236, 1),
    Color.fromRGBO(31, 192, 239, 1),
  ],
);
// font
const kLargeTitle = TextStyle(
    color: kNeutralDarkBlueColor,
    fontSize: 36,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    height: 1);
const kH1Heavy = TextStyle(
    color: kNeutralDarkBlueColor,
    fontSize: 24,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
    height: 1);
const kH1Medium = TextStyle(
    color: kNeutralDarkBlueColor,
    fontSize: 24,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    height: 1);
const kH2Heavy = TextStyle(
    color: kNeutralDarkBlueColor,
    fontSize: 20,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
    height: 1);
const kHeadlineHeavy = TextStyle(
    color: kNeutralDarkBlueColor,
    fontSize: 18,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
    height: 1);
const kHeadlineMedium = TextStyle(
    color: kNeutralDarkBlueColor,
    fontSize: 18,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    height: 1);
const kBodyHeavy = TextStyle(
    color: kNeutralDarkBlueColor,
    fontSize: 16,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
    height: 1);
const kBodyMedium = TextStyle(
    color: kNeutralDarkBlueColor,
    fontSize: 16,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    height: 1);
const kButtonHeavy = TextStyle(
    color: kNeutralDarkBlueColor,
    fontSize: 15,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
    height: 1);
const kSubtitleHeavy = TextStyle(
    color: kNeutralDarkBlueColor,
    fontSize: 14,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
    height: 1);
const kSubtitleMedium = TextStyle(
    color: kNeutralDarkBlueColor,
    fontSize: 14,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    height: 1);
const kSubtitleRoman = TextStyle(
    color: kNeutralDarkBlueColor,
    fontSize: 14,
    letterSpacing: 0,
    fontWeight: FontWeight.w300,
    height: 1);
const kCaptionHeavy = TextStyle(
    color: kNeutralDarkBlueColor,
    fontSize: 12,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
    height: 1);
const kCaptionMedium = TextStyle(
    color: kNeutralDarkBlueColor,
    fontSize: 12,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    height: 1);
const kCaptionRoman = TextStyle(
    color: kNeutralDarkBlueColor,
    fontSize: 12,
    letterSpacing: 0,
    fontWeight: FontWeight.w300,
    height: 1);
// padding
const double kDefaultPadding = 30.0;
