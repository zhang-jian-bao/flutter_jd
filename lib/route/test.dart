import 'package:flutter/material.dart';
class Test extends StatelessWidget {
  final String goodsId;
  Test(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('详情页'),),
      body:Column(
        children: <Widget>[
          Text('$goodsId')
        ],
      )
    );
  }
}