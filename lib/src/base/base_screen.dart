import 'package:aplopes_app/src/config/custom_colors.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
