import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorPickerSection extends StatelessWidget {
  final List<Color> colors;
  final int selectedColorIndex;
  final ValueChanged<int> onColorSelected;

  const ColorPickerSection({
    super.key,
    required this.colors,
    required this.selectedColorIndex,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FINISH',
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade400,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Pick a color',
          style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 24),
        Row(
          children: List.generate(
            colors.length,
            (index) => GestureDetector(
              onTap: () => onColorSelected(index),
              child: Container(
                margin: const EdgeInsets.only(right: 16),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selectedColorIndex == index
                        ? const Color(0xff51AC90)
                        : Colors.transparent,
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: colors[index],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
