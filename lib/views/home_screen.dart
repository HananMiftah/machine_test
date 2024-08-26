import 'package:flutter/material.dart';
import 'package:machine_test/models/banner.dart';
import 'package:machine_test/views/widgets/single_banner_widget.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';
import 'account.dart';
import 'cart.dart';
import 'categories.dart';
import 'offers.dart';
import 'widgets/category_widget.dart';
import 'widgets/banner_slider_widget.dart';
import 'widgets/product_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

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
              // Handle cart action
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
              return Center(child: Text('Error: ${viewModel.error}'));
            }

            return PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: [
                // Home Page Content
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BannerSliderWidget(banners: viewModel.banners),
                      if (viewModel.products.isNotEmpty)
                        ProductWidget(products: [viewModel.products.first]),
                      SingleBannerWidget(
                        banner: viewModel.singleBanner as BannerContent,
                        height: 180,
                        padding: const EdgeInsets.all(8),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      CategoryWidget(categories: viewModel.categories),
                      if (viewModel.products.length > 1)
                        ProductWidget(products: viewModel.products.sublist(1)),
                    ],
                  ),
                ),
                CategoriesPage(), // Categories Page
                CartPage(),       // Cart Page
                OffersPage(),     // Offers Page
                AccountPage(),    // Account Page
              ],
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(255, 84, 200, 87),
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: 'Offers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
