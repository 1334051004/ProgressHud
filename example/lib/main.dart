import 'package:flutter/material.dart';
import 'package:progress_hud10/progress_hud10.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final key = GlobalKey<ProgressHud10State>();

  @override
  void initState() {
    super.initState();
    
    Future.delayed(const Duration(seconds:30), (){
        this.key.currentState.updateLoad(false);
    });
  }

   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('星星编程'),
        ),
        body: ProgressHud10(key:this.key,loading: true ,color: Colors.red,width: 160,height: 160, child: Center(
        child: Text("加载动画简单示例"),
      ),
      ),
    )
    );
  }
}
