
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ShippingBanner extends StatelessWidget {
  const ShippingBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      color: const Color(0xFFF9F4EB),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            PhosphorIcons.truck(),
            color: Color(0xffA6875A),
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            'Shipping starts from 19th September onwards',
            style: GoogleFonts.roboto(
              color: Color(0xffA6875A),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
