import 'package:flutter/material.dart';

import 'package:groceryapp/domain/entities/grocery_product.dart';

/// Reusable card widget that displays a grocery product summary.
///
/// Does NOT import GoRouter — navigation is handled by the parent screen
/// via the [onTap] callback.
class ProductCard extends StatelessWidget {
  final GroceryProduct product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  static IconData _iconForCategory(String category) {
    switch (category) {
      case 'Fruits':
        return Icons.apple;
      case 'Vegetables':
        return Icons.grass;
      case 'Dairy':
        return Icons.egg;
      case 'Bakery':
        return Icons.breakfast_dining;
      case 'Meat':
        return Icons.set_meal;
      case 'Beverages':
        return Icons.local_drink;
      case 'Snacks':
        return Icons.cookie;
      default:
        return Icons.shopping_basket;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Leading icon
              CircleAvatar(
                backgroundColor: product.isOrganic
                    ? Colors.green.shade100
                    : theme.colorScheme.primaryContainer,
                child: Icon(
                  _iconForCategory(product.category),
                  color: product.isOrganic
                      ? Colors.green.shade700
                      : theme.colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 16),

              // Product info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${product.category}  •  ${product.unit}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),

              // Price
              Text(
                '₱${product.price.toStringAsFixed(2)}',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
