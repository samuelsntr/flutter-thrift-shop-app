import 'package:amazone_clone/constants/global_variables.dart';
import 'package:amazone_clone/features/account/screens/account_screen.dart';
import 'package:amazone_clone/features/cart/screens/cart_screen.dart';
import 'package:amazone_clone/features/home/screens/home_screen.dart';
import 'package:amazone_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  static const String routeName = '/actual-home';

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.portrait) {
          return Scaffold(
            body: pages[_page],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _page,
              selectedItemColor: GlobalVariables.selectedNavBarColor,
              unselectedItemColor: GlobalVariables.unselectedNavBarColor,
              backgroundColor: GlobalVariables.backgroundColor,
              iconSize: 28,
              onTap: updatePage,
              items: [
                // HOME SCREEN
                BottomNavigationBarItem(
                  label: '',
                  icon: Container(
                    width: bottomBarWidth,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: _page == 0
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidth,
                        ),
                      ),
                    ),
                    child: const Icon(Icons.home_outlined),
                  ),
                ),
                // PROFILE SCREEN
                BottomNavigationBarItem(
                  label: '',
                  icon: Container(
                    width: bottomBarWidth,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: _page == 1
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidth,
                        ),
                      ),
                    ),
                    child: const Icon(Icons.person_outline_outlined),
                  ),
                ),
                // CART SCREEN
                BottomNavigationBarItem(
                  label: '',
                  icon: Container(
                    width: bottomBarWidth,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: _page == 2
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidth,
                        ),
                      ),
                    ),
                    child: badges.Badge(
                      badgeContent: Text(userCartLen.toString()),
                      badgeStyle: const badges.BadgeStyle(
                        badgeColor: Colors.white,
                        elevation: 0,
                      ),
                      child: const Icon(Icons.shopping_cart_outlined),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: pages[_page],
            appBar: AppBar(
              title: const Text('Drawer'),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    title: const Text('Home'),
                    leading: const Icon(Icons.home_outlined),
                    onTap: () {
                      updatePage(0);
                      Navigator.pop(context);
                    },
                    selected: _page == 0,
                  ),
                  ListTile(
                    title: const Text('Profile'),
                    leading: const Icon(Icons.person_outline_outlined),
                    onTap: () {
                      updatePage(1);
                      Navigator.pop(context);
                    },
                    selected: _page == 1,
                  ),
                  ListTile(
                    title: const Text('Cart'),
                    leading: badges.Badge(
                      badgeContent: Text(userCartLen.toString()),
                      badgeStyle: const badges.BadgeStyle(
                        badgeColor: Colors.white,
                        elevation: 0,
                      ),
                      child: const Icon(Icons.shopping_cart_outlined),
                    ),
                    onTap: () {
                      updatePage(2);
                      Navigator.pop(context);
                    },
                    selected: _page == 2,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}


// class BottomBar extends StatefulWidget {
//   const BottomBar({super.key});
//   static const String routeName = '/actual-home';

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   int _page = 0;
//   double bottomBarWidth = 42;
//   double bottomBarBorderWidth = 5;

//   List<Widget> pages = [
//     const HomeScreen(),
//     const AccountScreen(),
//     const CartScreen()
//   ];

//   void updatePage(int page) {
//     setState(() {
//       _page = page;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final userCartLen = context.watch<UserProvider>().user.cart.length;
//     return Scaffold(
//       body: pages[_page],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _page,
//         selectedItemColor: GlobalVariables.selectedNavBarColor,
//         unselectedItemColor: GlobalVariables.unselectedNavBarColor,
//         backgroundColor: GlobalVariables.backgroundColor,
//         iconSize: 28,
//         onTap: updatePage,
//         items: [
//           // HOME SCREEN
//           BottomNavigationBarItem(
//             label: '',
//             icon: Container(
//               width: bottomBarWidth,
//               decoration: BoxDecoration(
//                 border: Border(
//                   top: BorderSide(
//                     color: _page == 0
//                         ? GlobalVariables.selectedNavBarColor
//                         : GlobalVariables.backgroundColor,
//                     width: bottomBarBorderWidth,
//                   ),
//                 ),
//               ),
//               child: const Icon(Icons.home_outlined),
//             ),
//           ),
//           // PROFILE SCREEN
//           BottomNavigationBarItem(
//             label: '',
//             icon: Container(
//               width: bottomBarWidth,
//               decoration: BoxDecoration(
//                 border: Border(
//                   top: BorderSide(
//                     color: _page == 1
//                         ? GlobalVariables.selectedNavBarColor
//                         : GlobalVariables.backgroundColor,
//                     width: bottomBarBorderWidth,
//                   ),
//                 ),
//               ),
//               child: const Icon(Icons.person_outline_outlined),
//             ),
//           ),
//           // CART SCREEN
//           BottomNavigationBarItem(
//             label: '',
//             icon: Container(
//               width: bottomBarWidth,
//               decoration: BoxDecoration(
//                 border: Border(
//                   top: BorderSide(
//                     color: _page == 2
//                         ? GlobalVariables.selectedNavBarColor
//                         : GlobalVariables.backgroundColor,
//                     width: bottomBarBorderWidth,
//                   ),
//                 ),
//               ),
//               child: badges.Badge(
//                 badgeContent: Text(userCartLen.toString()),
//                 badgeStyle: const badges.BadgeStyle(
//                   badgeColor: Colors.white,
//                   elevation: 0,
//                 ),
//                 child: const Icon(Icons.shopping_cart_outlined),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
