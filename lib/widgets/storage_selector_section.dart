import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StorageSelectorSection extends StatelessWidget {
  final List<String> storageOptions;
  final String selectedStorage;
  final ValueChanged<String> onStorageSelected;

  const StorageSelectorSection({
    super.key,
    required this.storageOptions,
    required this.selectedStorage,
    required this.onStorageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'STORAGE',
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade400,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'How much space do you need?',
          style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: storageOptions.map((storage) {
            final isSelected = storage == selectedStorage;
            return GestureDetector(
              onTap: () => onStorageSelected(storage),
              child: Container(
                width: 120,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  border: Border.all(
                    color: isSelected ? const Color(0xFF51AC90) : Colors.white,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF51AC90)
                              : Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                      child: isSelected
                          ? Center(
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF51AC90),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        storage,
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
