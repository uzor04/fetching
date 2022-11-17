import 'package:contactlist/widgets/fav_widget.dart';
import 'package:contactlist/widgets/home_widget.dart';
import 'package:contactlist/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  setindex(int index) => setState(() => selectedIndex = index);
  final List<Widget> _selectedwidget = const [
    HomeWidget(),
    FavWidget(),
    Profilewidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Contacts"),
        centerTitle: false,
      ),
      body: _selectedwidget[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: ((value) => setindex(value)),
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: ""),
          ]),
    );
  }
}
