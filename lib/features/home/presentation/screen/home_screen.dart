import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../utils/context_extensions.dart';
import '../../../../core/storage/auth_local_datasource.dart';
import '../../../../core/storage/auth_local_datasource_provider.dart';
import '../../../../data/repository/network_repository.dart';
import '../../../../router/app_router.dart';
import '../../../promotions/presentation/screen/promotion_screen.dart';
import '../../../account_information/presentation/screen/account_screen.dart';
import '../../../authentication/data/hive/user_repository.dart';
import '../../../trade/presentation/screens/trade_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;
  final ScrollController _homeScrollController = ScrollController();
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = const <Widget>[
      TradeScreen(),
      PromotionsScreen(), 
      AccountScreen(),
    ];
  }

  void _onItemTapped(int index) {
    if (index == 0 && _selectedIndex == 0) {
      _homeScrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    } else {
      setState(() => _selectedIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      /// 🏠 DASHBOARD BODY
      body: IndexedStack(index: _selectedIndex, children: _screens),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Trades'),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.chat_bubble),
              ],
            ),
            label: 'Promotions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
