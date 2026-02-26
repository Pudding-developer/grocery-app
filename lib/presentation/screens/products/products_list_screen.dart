import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:groceryapp/presentation/bloc/grocery_bloc.dart';
import 'package:groceryapp/presentation/bloc/grocery_state.dart';
import 'package:groceryapp/presentation/components/product_card.dart';

/// Scrollable list of grocery products driven by [GroceryBloc].
class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add-product'),
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<GroceryBloc, GroceryState>(
        listener: (context, state) {
          if (state is GroceryLoaded) {
            _scrollToBottom();
          }
        },
        builder: (context, state) {
          if (state is GroceryInitial || state is GroceryLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GroceryError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is GroceryLoaded) {
            if (state.products.isEmpty) {
              return const Center(child: Text('No products yet. Add one!'));
            }
            return ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductCard(
                  product: product,
                  onTap: () =>
                      context.push('/product-detail', extra: product),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
