import 'package:flutter/material.dart';
class MyPages extends StatefulWidget {
  MyPages({Key key}) : super(key: key);

  @override
  _MyPagesState createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            child: Text('我的'),
          )
        ],        
      ),
    );
  }
}