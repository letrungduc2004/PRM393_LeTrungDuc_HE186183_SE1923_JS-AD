import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/sample_data.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Collect unique categories
    final Set<String> categories = {'All'};
    for (var product in products) {
      categories.add(product.category);
    }
    final List<String> tabList = categories.toList();

    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          bottom: TabBar(
            isScrollable: true,
            tabs: tabList.map((category) => Tab(text: category)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabList.map((category) {
            final List<Product> filteredProducts = category == 'All'
                ? products
                : products.where((p) => p.category == category).toList();

            return ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];

                return ProductCard(
                  product: product,
                  onTap: () {
                    context.push('/product', extra: product);
                  },
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}