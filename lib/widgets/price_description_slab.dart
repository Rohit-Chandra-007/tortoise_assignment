import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceDesciptionSlab extends StatelessWidget {
  const PriceDesciptionSlab({
    super.key,
    required this.label,
    required this.description,
    required this.price,
    this.labelcolor = const Color(0xFF5FB894),
  });

  final String label;
  final String description;
  final String price;
  final Color labelcolor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: labelcolor,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                  height: 1.4,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Text(
          price,
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: labelcolor,
          ),
        ),
      ],
    );
  }
}
