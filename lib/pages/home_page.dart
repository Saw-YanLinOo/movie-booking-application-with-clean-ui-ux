import 'package:flutter/material.dart';
import 'package:movie_app_view_layer/pages/profile_page.dart';
import 'package:movie_app_view_layer/pages/ticket_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/widgets/icon.dart';

import '../data/models/movie_model_impl.dart';
import 'choose_cinema_page.dart';
import 'movie_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;

  static const pages = [
    MoviePage(),
    ChooseCinema(),
    TicketPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // preload snack category
    MovieModelImpl().getSnackCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: selectIndex,
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: MOVIE_PAGE_TEXT_BUTTON_COLOR,
        showUnselectedLabels: true,
        backgroundColor: BACKGROUND_COLOR,
        onTap: (value) {
          setState(() {
            selectIndex = value;
          });
        },
        items: [
          navigationItem(const Icon(Icons.smart_display), 'Movies'),
          navigationItem(
              CustomIcon(
                image: 'assets/icons/cinema_icon.png',
                color: selectIndex == 1
                    ? PRIMARY_COLOR
                    : MOVIE_PAGE_TEXT_BUTTON_COLOR,
              ),
              "Cinema"),
          navigationItem(
              CustomIcon(
                image: 'assets/icons/ticket_icon.png',
                color: selectIndex == 2
                    ? PRIMARY_COLOR
                    : MOVIE_PAGE_TEXT_BUTTON_COLOR,
              ),
              "Tickets"),
          navigationItem(const Icon(Icons.person), "Profile"),
        ],
      ),
    );
  }

  BottomNavigationBarItem navigationItem(Widget icon, String title) {
    return BottomNavigationBarItem(
      backgroundColor: BACKGROUND_COLOR,
      icon: icon,
      label: title,
      tooltip: title,
    );
  }
}
