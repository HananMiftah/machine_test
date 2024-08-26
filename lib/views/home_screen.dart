import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';
import 'widgets/category_widget.dart';
import 'widgets/banner_slider_widget.dart';
import 'widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel()..fetchHomeData(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 84, 200, 87),
          elevation: 4.0,
          leading: IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              // Handle cart icon action
            },
          ),
          title: Container(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search, color: Colors.black),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {
                // Handle notification icon action
              },
            ),
          ],
        ),
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (viewModel.error != null) {
              print("I am here");
              return Center(child: Text('Error: hanan ${viewModel.error}'));
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BannerSliderWidget(banners: viewModel.banners),
                  ProductWidget(products: viewModel.products),
                  CategoryWidget(categories: viewModel.categories),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
