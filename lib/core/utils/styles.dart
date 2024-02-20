import 'package:flutter/material.dart';

abstract class AppStyles {
  static const style25 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 25,
    fontFamily: 'Inter',
    height: 0,
  );

  static const style24 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 24,
    fontFamily: 'Inter',
    height: 0,
  );
  static const style22 = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 22,
    fontFamily: 'Inter',
    height: 0,
  );

  static const style20 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    fontFamily: 'Inter',
    height: 0,
  );

  static final styleRegular20 = const TextStyle().copyWith(
    color: Colors.black.withOpacity(0.8),
    fontWeight: FontWeight.w400,
    fontSize: 20,
    fontFamily: 'Inter',
    height: 0,
  );
  static const style18 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    fontFamily: 'Inter',
    height: 0,
  );
  static const styleSemiBold18 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    fontFamily: 'Inter',
    height: 0,
  );
}
