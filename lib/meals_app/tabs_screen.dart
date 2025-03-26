import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget{
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }

}

class _TabsScreenState extends State<TabsScreen>{
  late int _selectedPageIndex = 0;

  void _selectPage(int idx){
    setState(() {
      _selectedPageIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("dynamic"),),
      body: Text("this is body"),
      bottomNavigationBar: BottomNavigationBar(
          onTap:_selectPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorite"),
          ]),
    );
  }
}