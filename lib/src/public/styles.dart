import 'package:flutter/material.dart';

var colorBackground = Color(0xFF0E1111);

var colorBlack = Color(0xFF14171A);
var colorDarkGrey = Color(0xFF657786);
var colorPrimary = Color(0xFF1DA1F2);
var colorTitle = Color(0xFF2C3D50);

var colorHigh = Colors.redAccent;
var colorMedium = Colors.amber.shade700;
var colorLow = colorPrimary;
var colorCompleted = Colors.green;
var colorFailed = colorDarkGrey;
var colorActive = Color(0xFF00D72F);

Color mC = Colors.grey.shade100;
Color mCL = Colors.white;
Color mCM = Colors.grey.shade200;
Color mCH = Colors.grey.shade400;
Color mCD = Colors.black.withOpacity(0.075);
Color mCC = Colors.green.withOpacity(0.65);
Color fCD = Colors.grey.shade700;
Color fCL = Colors.grey;

BoxDecoration nMbox = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  color: mC,
  boxShadow: [
    BoxShadow(
      color: mCD,
      offset: Offset(10, 10),
      blurRadius: 10,
    ),
    BoxShadow(
      color: mCL,
      offset: Offset(-10, -10),
      blurRadius: 10,
    ),
  ],
);

BoxDecoration nMboxCategoryOff = BoxDecoration(
  shape: BoxShape.circle,
  color: mC,
  boxShadow: [
    BoxShadow(
      color: mCD,
      offset: Offset(10, 10),
      blurRadius: 10,
    ),
    BoxShadow(
      color: mCL,
      offset: Offset(-10, -10),
      blurRadius: 10,
    ),
  ],
);

BoxDecoration nMboxCategoryOn = BoxDecoration(
  shape: BoxShape.circle,
  color: mCD,
  boxShadow: [
    BoxShadow(
        color: mCL, offset: Offset(3, 3), blurRadius: 3, spreadRadius: -3),
  ],
);

BoxDecoration nMboxInvert = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: mCD,
    boxShadow: [
      BoxShadow(
          color: mCL, offset: Offset(3, 3), blurRadius: 3, spreadRadius: -3),
    ]);

BoxDecoration nMboxInvertActive = nMboxInvert.copyWith(color: mCC);

BoxDecoration nMbtn = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: mC,
  boxShadow: [
    BoxShadow(
      color: mCD,
      offset: Offset(2, 2),
      blurRadius: 2,
    )
  ],
);
