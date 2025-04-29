import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteText extends StatelessWidget {
  const QuoteText({
    super.key,
    required this.displayText,
    required this.textColor,
  });

  final String displayText;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: Duration(milliseconds: 300),
      style: GoogleFonts.poppins(
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
      ),
      child: Text(displayText),
    );
  }
}
