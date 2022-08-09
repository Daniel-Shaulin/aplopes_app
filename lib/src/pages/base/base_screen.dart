import 'package:aplopes_app/src/config/custom_colors.dart';
import 'package:aplopes_app/src/pages/home/home_tab.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController(
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index){
          setState(() {
            currentIndex = index;
          });
        },
        controller: pageController,
        children:[
          const HomeTab(),
          Container(color: Colors.red,),
          Container(color: Colors.cyan,),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });
        },
        backgroundColor: CustomColors.aplopesBasicColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color.fromRGBO(203, 199, 199, 1),
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon (Icons.home_outlined,),
              label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon (Icons.restaurant_menu,),
              label: 'Cardápio'
          ),
          BottomNavigationBarItem(
              icon: Icon (Icons.person,),
              label: 'Perfil',
          )


        ],
      ),
    );
  }
}
