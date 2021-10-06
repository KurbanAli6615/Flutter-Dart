import 'package:deli_meals/screens/categories_screen.dart';
import 'package:flutter/material.dart';

import 'favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      "page": CategoriesScreen(),
      "title": "Categories",
    },
    {
      "page": FavouriteScreen(),
      "title": "Favourites",
    },
  ];

  int _selectedPage = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPage]["title"]),
      ),
      drawer: Drawer(
        child: Text("Drawer"),
      ),
      body: _pages[_selectedPage]["page"],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPage,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourite",
          ),
        ],
      ),
    );
  }
}

// DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Meals"),
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favourites',
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(children: [
//           CategoriesScreen(),
//           FavouriteScreen(),
//         ]),
//       ),
//     );
