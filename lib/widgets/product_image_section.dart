import 'package:flutter/material.dart';
import 'package:tortoise_assignment/pages/product_detail_page.dart';

class ProductionImage extends StatelessWidget {
  const ProductionImage({
    super.key,
    required this.widget,
  });

  final ProductDetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Image.network(
            widget.product.imageUrl,
            height: 250,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 12),
          // Page indicator dots
          Container(
            height: 18,
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Color(0xffAFAFAF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                4,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 2,
                  ),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: index == 0
                        ? Colors.white
                        : Colors.grey.shade500,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
