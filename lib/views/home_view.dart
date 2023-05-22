import 'package:flutter/material.dart';
import 'package:insurance/views/register_view.dart';
import 'package:insurance/views/request_view.dart';
import 'package:insurance/views/search_view.dart';
import 'package:insurance/views/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

List<Widget> _pages = <Widget>[
  const SearchView(),
  const SettingsView(),
];

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Insurance'),
        ),
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RequestView(),
              ),
            )
          },
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
