# progress_hud10

progress_hud10是个简单的加载动画。

## 使用步骤

1、添加依赖

dependencies:
  dio: ^0.1.1  

2、示例

```
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
```

3、效果图

  ![ProgressHud.png](https://github.com/1334051004/ProgressHud/raw/master/example/ProgressHud.png)

4、参数说明

* loading  loading=false结束动画。loading=true开始动画。
* child  加载内容显示子组件。
* height 加载动画框的高度。
* width  加载动画框的宽度。
* color  加载动画框的颜色。
* bgColor  遮罩层的背景色。
* count  加载动画圆点的个数。
* speed  加载动画旋转的速度。
* opacity  遮罩层的透明度。

5、关注微信公众号交流学习

 ![关注公众号.jpg](https://github.com/1334051004/ProgressHud/raw/master/example/关注公众号.jpg)
