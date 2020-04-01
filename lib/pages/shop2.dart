import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ShopPages extends StatefulWidget {
  ShopPages({Key key}) : super(key: key);

  @override
  _ShopPagesState createState() => _ShopPagesState();
}

class _ShopPagesState extends State<ShopPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('购物车')),
      body:ss()
    );
  }
  //购物车商品组件
  Widget ss(){
    return Provide<Counter>(
      //获取仓库数据渲染页面
      builder: (context, child, counter) {
        List<Widget> wares = counter.obj.map((val) {
          return InkWell(
                child: new Container(
            child: Row(
              children: <Widget>[
              Container(
          child:ListView(children: <Widget>[
            Row(children:[
            _cartCheckButton(),
            _cartImage(val),
            _cartName(val),
            _cartPrice(val)
            ]
            )
          ],),
        ),
        Positioned(
          bottom:0,
          left:0,
          child:bottom()
        )
              ],
              
            ),
            padding: EdgeInsets.all(10),
          ),onTap:(){
            print(val["_id"]);
          } ,
             );
        }).toList();

        return Column(children: wares);
      },
    );
  } 
  
  //选择商品的按钮
  Widget _cartCheckButton() {
    return Container(
      alignment: Alignment.center,
      child: Checkbox(
        value: true,
        activeColor: Colors.pinkAccent,
        onChanged: (bool) {
          
        },
      ),
    );
  }

  //商品图片
  Widget _cartImage(str) {
    return Container(
      width:80,
      height: 80,
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
      ),
      child: Image.network("http://jd.itying.com/${str['pic']}"),
    );
  }

  //商品名称
  Widget _cartName(str) {
    return Container(
      width:120,
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Text("${str['title']}"),
        ],
      ),
    );
  }

  //商品价格
  Widget _cartPrice(str) {
    return Container(
      width: 100,
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Text("${str['price']}"),
          Container(
            child: InkWell(
              child: Icon(
                Icons.delete_forever,
                color: Colors.black26,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
  //底部结算组件
  
  Widget bottom(){
    return Container(
      height: 50,
      width: 360,
      padding: const EdgeInsets.all(5.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          _selectAllButton(),
          _totalPrice(),
          _goButton(),
        ],
      ),
    );
  }
  //全选按钮
  Widget _selectAllButton() {
    return Row(
      children: <Widget>[
        Checkbox(
          value: true,
          activeColor: Colors.pink,
          onChanged: (bool val) {},
        ),
        Text('全选'),
      ],
    );
  }

  //总计
  Widget _totalPrice() {
    return Container(
      width: 190,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: 80,
                child: Text(
                  '合计',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: 50,
                child: Text(
                  '￥1992',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize:14,
                  ),
                ),
              )
            ],
          ),
          Container(
            width: 200,
            alignment: Alignment.centerRight,
            child: Text(
              '满10元免配送费，预购免配送费',
              style: TextStyle(
                  color: Colors.black38,
                  fontSize:12),
            ),
          ),
        ],
      ),
    );
  }

  //结算组件
  Widget _goButton() {
    return Container(
      width: 80,
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Text(
            '结算',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}