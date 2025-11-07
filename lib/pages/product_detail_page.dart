import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tortoise_assignment/widgets/custom_app_bar.dart';
import 'package:tortoise_assignment/widgets/product_image_section.dart';
import 'package:tortoise_assignment/widgets/shipping_banner.dart';
import '../models/product.dart';
import '../widgets/product_specifications.dart';
import '../widgets/effective_price_bottom_sheet.dart';
import '../widgets/color_picker_section.dart';
import '../widgets/storage_selector_section.dart';
import '../widgets/price_bottom_sheet.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedColorIndex = 0;
  String selectedStorage = '128 GB';
  final ScrollController _scrollController = ScrollController();

  final List<Color> colors = [
    const Color(0xFF4A5568),
    const Color(0xFFD4D9D4),
    const Color(0xFFF5E6D3),
    const Color(0xFFE8D4D9),
    const Color(0xFFD4E3E8),
  ];

  final List<String> storageOptions = ['128 GB', '256 GB', '512 GB', '1 TB'];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Scrollable content area
            CustomAppBar(
              title: widget.product.name,
              scrollController: _scrollController,
              leadingIcon: PhosphorIconsFill.caretCircleLeft,
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    // Shipping info banner
                    ShippingBanner(),

                    // Product image section
                    ProductionImage(widget: widget),

                    // Tortoise Corporate Care banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      color: const Color(0xFF1F4A3C),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffE291DD),
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              PhosphorIcons.shieldCheck(),
                              color: Color(0xffE291DD),
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Protected with Tortoise Corporate Care',
                            style: GoogleFonts.roboto(
                              color: Color(0xffB6F4BA),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Color and storage options
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ColorPickerSection(
                            colors: colors,
                            selectedColorIndex: selectedColorIndex,
                            onColorSelected: (index) {
                              setState(() {
                                selectedColorIndex = index;
                              });
                            },
                          ),
                          const SizedBox(height: 40),
                          StorageSelectorSection(
                            storageOptions: storageOptions,
                            selectedStorage: selectedStorage,
                            onStorageSelected: (storage) {
                              setState(() {
                                selectedStorage = storage;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    // Product Specifications
                    const ProductSpecifications(),
                  ],
                ),
              ),
            ),

            // Fixed price section and Add to cart button at bottom
            PriceBottomSheet(
              devicePrice: '₹ 1,38,963',
              monthlyDeduction: 'Monthly deduction ₹18,900',
              effectivePrice: '₹ 92,483',
              onEffectivePriceTap: () {
                showEffectivePriceBottomSheet(context);
              },
              onAddToCart: () {
                // Handle add to cart
              },
            ),
          ],
        ),
      ),
    );
  }
}
