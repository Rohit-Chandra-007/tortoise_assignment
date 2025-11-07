import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/search_bar_with_chip.dart';
import '../widgets/brand_selector.dart';
import '../widgets/product_card.dart';
import '../models/product.dart';

class BrandCatalogPage extends StatefulWidget {
  const BrandCatalogPage({super.key});

  @override
  State<BrandCatalogPage> createState() => _BrandCatalogPageState();
}

class _BrandCatalogPageState extends State<BrandCatalogPage> {
  final List<String> brands = ["Apple", "Google", "Samsung", "OnePlus"];
  String selected = "Apple";
  List<Product> allProducts = [];
  List<Product> filteredProducts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/products.json',
      );
      final List<dynamic> data = json.decode(response);
      setState(() {
        allProducts = data.map((json) => Product.fromJson(json)).toList();
        filterProducts();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void filterProducts() {
    setState(() {
      filteredProducts = allProducts
          .where((product) => product.brand == selected)
          .toList();
    });
  }

  void onBrandSelected(String brand) {
    setState(() {
      selected = brand;
      filterProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SearchBarWithChip(
                chipLabel: selected,
                onChipRemove: () {},
              ),
            ),

            // Scrollable content
            Expanded(
              child: Container(
                color: Colors.grey.shade50,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    // Brand selector
                    BrandSelector(
                      brands: brands,
                      selectedBrand: selected,
                      onBrandSelected: onBrandSelected,
                    ),

                    const SizedBox(height: 32),

                    // Device grid
                    Text(
                      "Available devices",
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    if (isLoading)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(32),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    else
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.85,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          return ProductCard(product: filteredProducts[index]);
                        },
                      ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
