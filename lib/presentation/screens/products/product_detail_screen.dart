import 'package:flutter/material.dart';

import 'package:groceryapp/domain/entities/grocery_product.dart';

/// Detail view for a single grocery product.
///
/// Receives its data through the constructor — does NOT import GoRouter
/// or read `state.extra`.
class ProductDetailScreen extends StatelessWidget {
  final GroceryProduct product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with icon and name
            Center(
              child: CircleAvatar(
                radius: 48,
                backgroundColor: product.isOrganic
                    ? Colors.green.shade100
                    : theme.colorScheme.primaryContainer,
                child: Icon(
                  product.isOrganic ? Icons.eco : Icons.shopping_basket,
                  size: 48,
                  color: product.isOrganic
                      ? Colors.green.shade700
                      : theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                product.name,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Chip(
                label: Text(product.category),
                avatar: const Icon(Icons.label_outline, size: 18),
              ),
            ),
            const SizedBox(height: 24),

            // Description
            Text(
              'Description',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),

            // Details table
            _DetailRow(label: 'Price', value: '₱${product.price.toStringAsFixed(2)} / ${product.unit}'),
            _DetailRow(label: 'Unit', value: product.unit),
            _DetailRow(label: 'Organic', value: product.isOrganic ? 'Yes ✅' : 'No'),
            _DetailRow(label: 'In Stock', value: '${product.stockQuantity} units'),
            _DetailRow(label: 'ID', value: product.id),
          ],
        ),
      ),
    );
  }
}

/// Simple label-value row for the detail view.
class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
