import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tyreplex_demo/core/viewmodels/home_view_model.dart';
import 'package:tyreplex_demo/ui/widgets/custom_app_bar.dart';
import 'package:tyreplex_demo/ui/widgets/custom_search_bar.dart';
import '../../core/models/product_model.dart';
import '../widgets/error_view.dart';
import '../widgets/product_card.dart';
import 'base_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _filteredProducts = [];
  HomeViewModel? homeViewModel;

  @override
  void dispose() {
    _searchController.dispose();
    homeViewModel!.removeListener(_onProductsUpdated);
    super.dispose();
  }

  void _onProductsUpdated() {
    setState(() {
      // Reset filtered products whenever products list updates
      _filteredProducts = homeViewModel!.products;
    });
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        _filteredProducts = homeViewModel!.products;
      } else {
        _filteredProducts = homeViewModel!.products.where((product) {
          final title = product.title?.toLowerCase() ?? '';
          return title.contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) {
        homeViewModel = model;
        SchedulerBinding.instance.addPostFrameCallback((_) async {
          model.fetchProducts();
          _searchController.addListener(_onSearchChanged);

          // Initialize filtered products only if products are loaded
          if (homeViewModel!.products.isNotEmpty) {
            _filteredProducts = homeViewModel!.products;
          }

          // Optionally listen for changes if your ViewModel notifies listeners
          homeViewModel!.addListener(_onProductsUpdated);
        });
      },
      builder: (context, model, child) {
        return buildBody(homeViewModel);
      },
    );
  }

  Widget buildBody(HomeViewModel? homeViewModel) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.all(6),
          children: [
            CustomAppBar(),
            CustomSearchBar(controller: _searchController),
            const SizedBox(height: 10),
            if (homeViewModel == null)
              const Center(child: CircularProgressIndicator())
            else if (homeViewModel.loading)
              const Center(child: CircularProgressIndicator())
            else if (homeViewModel.error != null)
              ErrorView(message: homeViewModel.error!)
            else
              ..._filteredProducts.map((product) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    // You get maxWidth and maxHeight here
                    final maxWidth = constraints.maxWidth;
                    // For example: show compact version if width < 300
                    final isCompact = maxWidth < 430;

                    return ProductCard(
                      product: product,
                      isCompact:
                          isCompact, 
                    );
                  },
                );
              }).toList(),
          ],
        ),
      ),
    );
  }
}
