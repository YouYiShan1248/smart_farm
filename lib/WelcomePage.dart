import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_farm/mainPage.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _currentime = 3;
  late Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer= Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        _currentime--;
        if(_currentime<=0){
          _timer.cancel();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
            return mainPage();
          }), (route) => false);
        }
      });
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "images/common/welcome.png",
              fit: BoxFit.cover,),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: MediaQuery.of(context).padding.right +10,
              child: InkWell(
                onTap: (){
                  _timer.cancel();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                    return mainPage();
                  }), (route) => false);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 60,
                    width: 60,
                    color: Colors.black.withOpacity(0.2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("点击跳转",style: TextStyle(color: Colors.white,fontSize: 12),),
                        Text("${_currentime}s",style: TextStyle(color: Colors.white,fontSize: 12),),
                      ],
                    ),
                  ),
                ),
              ),
          )
        ],
      ),
    );
  }
}
