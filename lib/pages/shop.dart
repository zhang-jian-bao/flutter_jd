import 'package:flutter/material.dart';
class ShopPages extends StatefulWidget {
  ShopPages({Key key}) : super(key: key);

  @override
  _ShopPagesState createState() => _ShopPagesState();
}

class _ShopPagesState extends State<ShopPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            child: Text('购物车'),
          )
        ],        
      ),
    );
  }
}

//传参
// class Son extends StatefulWidget {
//   Son({Key key,}) : super(key: key);

//   @override
//   _SonState createState() => _SonState();
// }

// class _SonState extends State<Son> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        child: child,
//     );
//   }
// }