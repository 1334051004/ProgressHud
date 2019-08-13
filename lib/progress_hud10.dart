library progress_hud10;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:progress_hud10/round_painter.dart';
 

class ProgressHud10 extends StatefulWidget {
  final bool loading;
  final Widget child;
  final double height;
  final double width;
  final Color color;
  final Color bgColor;
  final int count;
  final int speed;
  final double opacity;
 

  ProgressHud10( 
      {Key key,
      @required this.loading,
      @required this.child,
      this.color=Colors.green,
      this.bgColor=Colors.white,
      this.width = 160,
      this.height = 160,
      this.count=12,
      this.speed=80,
      this.opacity=0.2})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProgressHud10State();
  }
}

class ProgressHud10State extends State<ProgressHud10> {
  Timer timer;
  bool loading;
  Widget child;
  double height;
  double width;
  Color color;
  Color bgColor;
  int count;
  int speed;
  double opacity;

  List<Offset> offsetList = [];
  List<double> radiusList = [];
  List<double> radianList = [];
  double moveViewSize;
  double moveSize;
  double w;
  double r;


void updateLoad(bool loading) {
    setState((){
      this.loading = loading;
    });
}

void updateChild(Widget child) {
    setState((){
      this.child = child;
    });
}


  @override
  void initState() {
    super.initState();
    this.loading = widget.loading;
    this.child = widget.child;
    this.width = widget.width;
    this.height = widget.height;
    this.color = widget.color;
    this.bgColor = widget.bgColor;
    this.count = widget.count;
    this.speed = widget.speed;
    this.opacity = widget.opacity;


    this.moveViewSize = 1;
    this.moveSize = 1;

  
    this.timer = Timer.periodic(new Duration(milliseconds: this.speed), (timer) {
      setState(() {
        double r = this.width;
        if (r > this.height) {
          r = this.height;
        }
        r = r / 2.0;
        r = r * this.moveSize;
        double w = r * sin(2 * pi / this.count) / 2.0;

        r -= (w / 2.0);
        w = w * this.moveViewSize;
        this.r = r;
        this.w = w;
        List<Offset> oList = [];
        List<double> rList = [];
        List<double> radianList = [];

        for (int i = 1; i < this.count + 1; i++) {
          w = this.w * i / this.count;

          double radian = (pi * 2.0 / this.count) * i;
          Offset offset = Offset(this.width / 2.0 + this.r * cos(radian),
              this.r * sin(radian) + this.height / 2.0);
          if (this.radianList.length > 0) {
            radian = this.radianList[i - 1] +  pi * 2.0 / (2.0 *this.count);
            offset = Offset(this.width / 2.0 + this.r * cos(radian),
                this.height / 2.0 + this.r * sin(radian));
          }

          oList.add(offset);
          rList.add(w / 2.0);
          radianList.add(radian);
        }
        this.offsetList = oList;
        this.radiusList = rList;
        this.radianList = radianList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
   
    //如果正在加载，则显示加载添加加载中布局
    if (this.loading) {
      widgetList.add(this.child);
      //增加一层黑色背景透明度为0.8
      widgetList.add(
        Opacity(
            opacity: this.opacity,
            child: ModalBarrier(
              color: Colors.black,
            )),
      );
      //环形进度条
      widgetList.add(Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              //黑色背景
              color: this.bgColor,
              //圆角边框
              borderRadius: BorderRadius.circular(10.0)),
          child: CustomPaint(
            painter: RoundPainter(
                offsetList: this.offsetList, radiusList: this.radiusList,color: this.color),
            size: Size( this.width,  this.height),
          ),
        ),
      ));
    }else{
      widgetList=[];
      widgetList.add(this.child);
    }
    return Stack(
      children: widgetList,
    );
  }

 

  @override
  void dispose() {
    super.dispose();
    this.timer.cancel();
  }
}
