import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medlink/view/customer/home/home_page.dart';
import 'package:sizer/sizer.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          showUnselectedLabels: false,
          showSelectedLabels: false,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          selectedLabelStyle: const TextStyle(color: Colors.lightBlue),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                activeIcon: CircleAvatar(
                  radius: 2.3.h,
                  backgroundColor: Colors.lightBlue,
                  child: const Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                ),
                icon: const Icon(Icons.home_filled),
                label: "Home"),
            BottomNavigationBarItem(
                activeIcon: CircleAvatar(
                  radius: 2.3.h,
                  backgroundColor: Colors.lightBlue,
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
                icon: const Icon(Icons.favorite),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: CircleAvatar(
                  radius: 2.3.h,
                  backgroundColor: Colors.lightBlue,
                  child: const Icon(
                    CupertinoIcons.book_solid,
                    color: Colors.white,
                  ),
                ),
                icon: const Icon(Icons.chat_bubble),
                label: "Chat"),
            BottomNavigationBarItem(
                activeIcon: CircleAvatar(
                  radius: 2.3.h,
                  backgroundColor: Colors.lightBlue,
                  child: const Icon(
                    CupertinoIcons.chat_bubble_text_fill,
                    color: Colors.white,
                  ),
                ),
                icon: const Icon(CupertinoIcons.chat_bubble_text_fill),
                label: "Profile"),
          ]),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Page 3 Content'));
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Page 3 Content'));
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Page 3 Content'));
  }
}
