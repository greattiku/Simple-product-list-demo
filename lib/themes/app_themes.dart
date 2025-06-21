import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/colors.dart';

class AppThemes {
    
       final lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    colorScheme: const ColorScheme.light(
        primary: AppColors.appPrimaryColor,),
  );

}