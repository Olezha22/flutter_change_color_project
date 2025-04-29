import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeyThereText extends StatelessWidget {
  const HeyThereText({
    super.key,
    required this.heyThereText,
    required this.textColor,
  });

  final String heyThereText;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: Duration(milliseconds: 300),
      style: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textColor,
        decoration: TextDecoration.none,
      ),
      child: Text(heyThereText),
    );
  }
}
