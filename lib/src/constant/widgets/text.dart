import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FxText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final TextOverflow? textOverflow;

  const FxText({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.fontWeight,
    this.fontFamily,
    this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: GoogleFonts.poppins(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
