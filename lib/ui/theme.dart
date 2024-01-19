//themes colors as const #178CCB #5D1AFDB  # A2D1EA #E8F4FA
import 'package:flutter/material.dart';

const bleu = Color(0xFF178CCB);
const bleuClair = Color(0xFF5DAFDB);
const bleuTresClair = Color(0xFFA2D1EA);
const bleuTresTresClair = Color(0xFFE8F4FA);
 //genrate a theme the using this colors
final ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: bleu,
    secondary: bleuClair,
    onSecondary: bleuTresClair,
    background: bleuTresTresClair,
  ),
  useMaterial3: true,);


