

import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier{

  static ThemeData get Theme{
    return ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.white,
      backgroundColor: Colors.purple,
      scaffoldBackgroundColor: Colors.red,

    );
  }
}