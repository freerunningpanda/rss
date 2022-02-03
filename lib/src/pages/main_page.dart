import 'package:flutter/material.dart';

import '../pages/last_news_page/last24_news_page/last24_news_page.dart';
import '../pages/last_news_page/last_news_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedItem = 0;
  late Widget bodyWidget;

  @override
  void initState() {
    super.initState();
    onItemTapped(0);
  }

  void onItemTapped(int index) {
    setState(() {
      selectedItem = index;
      bodyWidget = buildCurrentWidget(index);
    });
  }

  Widget buildCurrentWidget(int type) {
    switch (type) {
      case 0:
        return const LastNewsPage();
      case 1:
        return const Last24NewsPage();
      default:
        throw ArgumentError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: bodyWidget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue[900],
        currentIndex: selectedItem,
        selectedFontSize: 14,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blue[200],
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'ТОП'),
          BottomNavigationBarItem(
              icon: Icon(Icons.new_releases), label: 'Актуальное за 24ч.'),
        ],
      ),
    );
  }
}
