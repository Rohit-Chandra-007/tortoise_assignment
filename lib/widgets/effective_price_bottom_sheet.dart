import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tortoise_assignment/widgets/custom_button.dart';

import 'package:tortoise_assignment/widgets/dash_divider.dart';
import 'package:tortoise_assignment/widgets/price_description_slab.dart';

class EffectivePriceBottomSheet extends StatelessWidget {
  const EffectivePriceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    const String selectedTaxSlab = '30%';
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Center(
                    child: Text(
                      'EFFECTIVE PRICE',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade400,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Description
                  Center(
                    child: Text(
                      'The effective price is the device\'s cost after\nsavings, based on your payroll structure',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Info card with shadow
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Tax slab
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tax slab',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  selectedTaxSlab,
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  PhosphorIcons.caretDown(
                                    PhosphorIconsStyle.fill,
                                  ),
                                  size: 16,
                                  color: Colors.black87,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Dashed divider
                        const DashedDivider(),
                        const SizedBox(height: 20),

                        // Effective price
                        PriceDesciptionSlab(
                          label: 'Effective price of the device',
                          description:
                              'Price calculation based on selected tax slab',
                          price: '₹92,483*',
                        ),
                        const SizedBox(height: 20),

                        // Dashed divider
                        const DashedDivider(),
                        const SizedBox(height: 20),

                        // Impact in monthly in-hand
                        PriceDesciptionSlab(
                          label: 'Impact in monthly in-hand',
                          description:
                              'You monthly in-hand salary will be\nreduced by this amount',
                          price: '₹7,706*',
                          labelcolor: Colors.black,
                        ),
                        const SizedBox(height: 20),

                        // Solid divider
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 16),

                        // Know more expandable section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Know more',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF5FB894),
                              ),
                            ),
                            Icon(
                              PhosphorIcons.caretDown(PhosphorIconsStyle.fill),
                              size: 16,
                              color: const Color(0xFF5FB894),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Okay button
                  CustomButton(label: "Okay! Understood"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showEffectivePriceBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => EffectivePriceBottomSheet(),
  );
}
