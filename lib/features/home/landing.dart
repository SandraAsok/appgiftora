import 'package:appgiftora/core/app_colors.dart';
import 'package:appgiftora/features/ai_assistant/ai_assistant.dart';
import 'package:appgiftora/features/cart/cart.dart';
import 'package:appgiftora/features/home/home.dart';
import 'package:appgiftora/features/products/all_products.dart';
import 'package:appgiftora/features/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(),
          AiAssistant(),
          CartPage(),
          AllProducts(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildBottomNavigation() {
    final items = <(IconData, String)>[
      (Icons.home_rounded, 'Home'),
      (Icons.chat_bubble_outline, 'Message'),
      (Icons.favorite_border, 'Saved'),
      (Icons.grid_view_outlined, 'Category'),
      (Icons.person_outline, 'Account'),
    ];

    return CurvedNavigationBar(
      index: _selectedIndex,
      items: [
        for (var i = 0; i < items.length; i++)
          Icon(
            items[i].$1,
            size: 26,
            color: i == _selectedIndex ? AppColors.bgcolor : Colors.white,
          ),
      ],
      color: AppColors.bgcolor,
      buttonBackgroundColor: const Color(0xFFFFE9ED),
      backgroundColor: const Color(0xFFFFF8F8),
      animationCurve: Curves.easeOut,
      animationDuration: const Duration(milliseconds: 500),
      onTap: (index) => setState(() => _selectedIndex = index),
    );
  }
}
