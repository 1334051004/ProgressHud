import 'package:flutter/material.dart';
import 'package:progress_hud10/progress_hud10.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final key = GlobalKey<ProgressHudState>();

  @override
  void initState() {
    super.initState();
    
    Future.delayed(const Duration(seconds:10), (){
        this.key.currentState.updateLoad(false);
    });
  }

   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('星星编程'),
        ),
        body: ProgressHud(key:this.key,loading: true ,width: 160,height: 160, child: Center(
        child: Text("加载动画结束"),
      ),
      ),
    )
    );
  }
}
