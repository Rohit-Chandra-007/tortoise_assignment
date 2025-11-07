import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandSelector extends StatelessWidget {
  final List<String> brands;
  final String selectedBrand;
  final ValueChanged<String>? onBrandSelected;

  const BrandSelector({
    super.key,
    required this.brands,
    required this.selectedBrand,
    this.onBrandSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text(
          'Search from popular brands',
          style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Row(
          children: brands.asMap().entries.map((entry) {
            final index = entry.key;
            final brand = entry.value;
            final isSelected = brand == selectedBrand;
            final isLast = index == brands.length - 1;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: isLast ? 0 : 8),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: GestureDetector(
                    onTap: () => onBrandSelected?.call(brand),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected ? Colors.black : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/brands/${brand.toLowerCase()}.png",
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            brand,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
