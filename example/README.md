# progress_hud10_example

Demonstrates how to use the progress_hud10 plugin.

## Getting Started

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
