import 'package:flutter/material.dart';
import 'package:livet_mobile/widgets/customAppBar.dart';
import 'package:livet_mobile/widgets/historiaClinica.dart';
import 'package:livet_mobile/widgets/indicaciones.dart';

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
    setState(() {
      index = newIndex;
    });
    _pageController.jumpToPage(index);
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
        children: const [
          Indicaciones(),
          HistoriaClinica(),
        ],
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
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Next",
          ),
        ],
      ),
    );
  }
}
