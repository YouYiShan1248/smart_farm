import 'package:flutter/material.dart';
import 'package:smart_farm/childrenView/homePage.dart';
import 'package:smart_farm/childrenView/minePage.dart';
import 'package:smart_farm/childrenView/uploadPage.dart';
class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int _currenIndex =0;
  List Pages = [
    HomePage(),
    uploadPage(),
    minePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[_currenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            _currenIndex = index;
          });
        },
        currentIndex: _currenIndex,
        items: [
          BottomNavigationBarItem(
            label: "首页",
            icon: Image.asset("images/icons/home.png",
              height: 24,
              width: 24,),
            activeIcon: Image.asset("images/icons/home_activity.png",
              height: 32,
              width: 32,),
          ),
          BottomNavigationBarItem(
            label: "上传",
            icon: Image.asset("images/icons/upload.png",
              height: 24,
              width: 24,),
            activeIcon: Image.asset("images/icons/upload_activity.png",
              height: 32,
              width: 32,),
          ),
          BottomNavigationBarItem(
            label: "我的",
            icon: Image.asset("images/icons/Mine.png",
              height: 24,
              width: 24,),
            activeIcon: Image.asset("images/icons/Mine_activity.png",
              height: 32,
              width: 32,),
          ),
        ],
      ),
    );
  }
}
