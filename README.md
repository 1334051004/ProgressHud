# progress_hud10

progress_hud10是个简单的加载动画。

## 使用步骤

1、添加依赖

dependencies:
  dio: ^0.0.2   

2、示例

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final key = GlobalKey<ProgressHudState>();

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
        body: ProgressHud(key:this.key,loading: true ,color: Colors.red,width: 160,height: 160, child: Center(
        child: Text("加载动画简单示例"),
      ),
      ),
    )
    );
  }
}

3、效果图

  ./example/ProgressHud.png


