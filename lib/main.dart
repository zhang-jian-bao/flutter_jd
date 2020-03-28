import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/search.dart';
import 'pages/shop.dart';
import 'pages/my.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';//引入屏幕适配库

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bottom_nav(),
    );
  }
}

class bottom_nav extends StatefulWidget {
  // bottom_nav({Key key}) : super(key: key);
  
  @override
  _bottom_navState createState() => _bottom_navState();
}

class _bottom_navState extends State<bottom_nav> {
  var  _index = 0;
  var list = [HomePages(), SearchPages(), ShopPages(), MyPages()];
  @override
  Widget build(BuildContext context) {
     ScreenUtil.init(context, width: 750, height: 1579, allowFontScaling: false);
    return Scaffold(
      body: list[_index],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
        BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('分类')),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), title: Text('购物车')),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('会员中心')),
      ],
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.red,
      currentIndex: this._index,
      onTap: (index){
        setState(() {
          _index=index;
        });
      },
      ),
    );
  }
}
