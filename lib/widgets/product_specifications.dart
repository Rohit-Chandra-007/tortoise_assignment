import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProductSpecifications extends StatefulWidget {
  const ProductSpecifications({super.key});

  @override
  State<ProductSpecifications> createState() => _ProductSpecificationsState();
}

class _ProductSpecificationsState extends State<ProductSpecifications> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'SPECIFICATIONS',
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade400,
              letterSpacing: 1,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Specs view - showing limited or all specs based on state
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSpecItem(
                      icon: PhosphorIcons.arrowsOutSimple(),
                      title: 'Screen size',
                      value: '6.3 inches',
                    ),
                    const SizedBox(height: 20),
                    _buildSpecItem(
                      icon: PhosphorIcons.cpu(),
                      title: 'Processor',
                      value: 'Snapdragon 8 Gen 2',
                    ),
                    _buildSpecItem(
                      icon: PhosphorIcons.camera(),
                      title: 'Camera',
                      value: 'Rear facing: 48 MP',
                    ),
                    const SizedBox(height: 20),
                    _buildSpecItem(
                      icon: PhosphorIcons.database(),
                      title: 'Storage and RAM',
                      value: '8 GB | 512 GB',
                    ),
                    const SizedBox(height: 20),
                    _buildSpecItem(
                      icon: PhosphorIcons.batteryEmpty(),
                      title: 'Battery',
                      value: 'Up to 27 hours video playback',
                    ),
                    const SizedBox(height: 20),
                    _buildSpecItem(
                      icon: PhosphorIcons.cellSignalFull(),
                      title: 'Connectivity',
                      value: '5G',
                    ),
                  ],
                ),
              ),

              // Divider
              Divider(
                height: 1,
                color: Colors.grey.shade200,
                endIndent: 20,
                indent: 20,
              ),

              // More details / Show less button
              InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isExpanded ? 'Show less' : 'More details',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF51AC90),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Color(0xFF51AC90),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isExpanded
                              ? PhosphorIcons.caretUp()
                              : PhosphorIcons.caretDown(),
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSpecItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 24, color: Colors.grey.shade700),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
