import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppFonts {
  static final regular = GoogleFonts.nunitoSans(
      fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.gray4);
  static final bold = GoogleFonts.nunitoSans(
      fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.gray4);
}
