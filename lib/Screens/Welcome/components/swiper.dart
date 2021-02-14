import 'package:Connect_buddy/Screens/Welcome/components/about_screen.dart';
import 'package:Connect_buddy/Screens/Welcome/connect_screen.dart';
import 'package:Connect_buddy/Screens/Welcome/find_screen.dart';
import 'package:Connect_buddy/Screens/Welcome/search_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperFunction extends StatelessWidget {
  List<Widget> pages = [
    AboutScreen(),
    SearchScreen(),
    FindScreen(),
    ConnectScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motivational Quote App',
      home: Scaffold(
          body: Swiper(
        itemCount: pages.length,
        pagination: SwiperPagination(),
        itemBuilder: (BuildContext context, int index) => pages[index],
      )),
    );
  }
}
