import 'package:flutter/material.dart';
class ShopPages extends StatefulWidget {
  ShopPages({Key key}) : super(key: key);

  @override
  _ShopPagesState createState() => _ShopPagesState();
}

class _ShopPagesState extends State<ShopPages> {
  String aa='hello';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            child: Son(aa: 'hello11111',),
          )
        ],        
      ),
    );
  }
}

//传参
class Son extends StatefulWidget {
  Son({Key key,this.aa}) : super(key: key);
  String aa;

  @override
  _SonState createState() => _SonState();
}

class _SonState extends State<Son> {
  var a;
  @override
  void initState() { 
    super.initState();
    a=widget.aa;
    print(widget.aa);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text(a),
    );
  }
}