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
          title: Text('Home'),
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
                  CategoryWidget(categories: viewModel.categories),
                  BannerSliderWidget(banners: viewModel.banners),
                  ProductWidget(products: viewModel.products),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
