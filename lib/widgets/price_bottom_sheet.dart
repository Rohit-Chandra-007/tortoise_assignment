import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tortoise_assignment/widgets/custom_button.dart';

class PriceBottomSheet extends StatelessWidget {
  final String devicePrice;
  final String monthlyDeduction;
  final String effectivePrice;
  final VoidCallback onEffectivePriceTap;
  final VoidCallback onAddToCart;

  const PriceBottomSheet({
    super.key,
    required this.devicePrice,
    required this.monthlyDeduction,
    required this.effectivePrice,
    required this.onEffectivePriceTap,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Price cards
            Row(
              children: [
                // Device Price
                Expanded(
                  child: _PriceCard(
                    label: 'DEVICE PRICE',
                    price: devicePrice,
                    subtitle: monthlyDeduction,
                    labelColor: Colors.grey.shade600,
                    priceColor: Colors.black,
                    subtitleColor: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(width: 12),
                // Effective Price
                Expanded(
                  child: GestureDetector(
                    onTap: onEffectivePriceTap,
                    child: _PriceCard(
                      label: 'EFFECTIVE PRICE',
                      price: effectivePrice,
                      subtitle: 'See impact in net-salary',
                      labelColor: const Color(0xFF546F68),
                      priceColor: const Color(0xFF51AC90),
                      subtitleColor: const Color(0xFF51AC90),
                      showArrow: true,
                      borderColor: const Color(0xFF51AC90).withOpacity(0.3),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Add to cart button
            CustomButton(label: 'Add to cart'),
          ],
        ),
      ),
    );
  }
}

class _PriceCard extends StatelessWidget {
  final String label;
  final String price;
  final String subtitle;
  final Color labelColor;
  final Color priceColor;
  final Color subtitleColor;
  final bool showArrow;
  final Color? borderColor;

  const _PriceCard({
    required this.label,
    required this.price,
    required this.subtitle,
    required this.labelColor,
    required this.priceColor,
    required this.subtitleColor,
    this.showArrow = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: showArrow
            ? const Color(0xFF5FB894).withValues(alpha: 0.05)
            : Colors.grey.shade100,
        border: Border.all(color: borderColor ?? Colors.white),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  label,
                  style: GoogleFonts.roboto(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: labelColor,
                    letterSpacing: 0.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                ),
              ),
              if (showArrow)
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Color(0xFF5FB894),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    PhosphorIcons.caretRight(),
                    size: 16,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
          const Spacer(),
          Text(
            price,
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: priceColor,
              height: 1.0,
              letterSpacing: 0,
            ),
            maxLines: 1,
            overflow: TextOverflow.visible,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: GoogleFonts.roboto(
              fontSize: 9,
              color: subtitleColor,
              height: 1.0,
            ),
            maxLines: 1,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
