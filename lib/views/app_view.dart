import 'package:flutter/material.dart';
import 'package:livet_mobile/widgets/calendar.dart';
import 'package:livet_mobile/widgets/custom_app_bar.dart';
import 'package:livet_mobile/widgets/clinical_history.dart';
import 'package:livet_mobile/widgets/indicaciones.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int index = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: index);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTap(int newIndex) {
    changeState(newIndex);
    _pageController.jumpToPage(index);
  }

  void changeState(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const CustomAppBar(),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: PageView(
        controller: _pageController,
        children: [
          const Indicaciones(),
          AppoinmentCalendar(),
          const HistoriaClinica(),
        ],
        onPageChanged: changeState,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTap,
        currentIndex: index,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.fileMedical),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.calendar),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.listCheck),
            label: 'Next',
          ),
        ],
      ),
    );
  }
}
