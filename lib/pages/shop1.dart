import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../provide/counter.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';
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
      body: Provide<Counter>(
      //获取仓库数据渲染页面
      builder: (context, child, counter) {
        return CartItem(str:counter.obj);
      }
      )
    );
  }
}
  //全选按钮
  Widget _selectAllButton(context) {
    return Row(
      children: <Widget>[
        // Checkbox(
        //   // value: Provide.value<Counter>(context).isAllCheck,
        //   activeColor: Colors.pink,
        //   onChanged: (bool val) {
        //     // Provide.value<Counter>(context).changeAllCheckSate(val);
        //   },
        // ),
        Text('全选'),
      ],
    );
  }

  //总计
  Widget _totalPrice(context) {
    // double totalPrice = Provide.value<Counter>(context).totalPrice;
    return Container(
      width: ScreenUtil().setWidth(430),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(280),
                child: Text(
                  '合计',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(150),
                child: Text(
                  '￥1111111',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: ScreenUtil().setSp(36),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(430),
            alignment: Alignment.centerRight,
            child: Text(
              '满10元免配送费，预购免配送费',
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: ScreenUtil().setSp(22)),
            ),
          ),
        ],
      ),
    );
  }

  //结算组件
  Widget _goButton(context) {
    // int totalGoodsCount = Provide.value<Counter>(context).totalGoodsCount;
    return Container(
      // width: ScreenUti().setWidth(170),
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
            '结算12331',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

class CartItem extends StatefulWidget {
  CartItem({Key key,this.str}) : super(key: key);
  var str;
  @override
  _CartItemState createState() => _CartItemState();
}

class  _CartItemState extends State<CartItem> {
  @override
  void initState() {
    // TODO: implement initState
    print(widget.str);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.black12,
          ),
        ),
      ),
      child:aa(widget.str),
    );
  }
    Widget aa(e){
    List<dynamic> shop=e.map((val){
      return Container(
        child:  Row(
        children: <Widget>[
          _cartCheckButton(val),
          _cartImage(val),
          _cartName(val),
          _cartPrice(val)
        ],
      ),
      );
    }).toList();
  return Column(children: shop,);
  }
}

  //选择商品的按钮
  Widget _cartCheckButton(val) {
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
  Widget _cartImage(val) {
    return Container(
      width: ScreenUtil().setWidth(150),
      height: ScreenUtil().setHeight(150),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
      ),
      child: Image.network("http://jd.itying.com/${val['pic']}"),
      //  child: Text('33333333333'),
    );
  }

  //商品名称
  Widget _cartName(val) {
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Text("${val['title']}"),
          // Text('111111111'),
        ],
      ),
    );
  }

  //商品价格
  Widget _cartPrice(val) {
    return Container(
      width: ScreenUtil().setWidth(150),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Text('￥${val['price']}'),
          // Text('￥11111111'),
          Container(
            child: InkWell(
              child: Icon(
                Icons.delete_forever,
                color: Colors.black26,
                size: 30,
              ),
            )
          )
        ]
      )
    );
  }
// //传参
// class Son extends StatefulWidget {
//   Son({Key key,this.aa}) : super(key: key);
//   String aa;

//   @override
//   _SonState createState() => _SonState();
// }

// class _SonState extends State<Son> {
//   var a;
//   @override
//   void initState() { 
//     super.initState();
//     a=widget.aa;
//     print(widget.aa);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        child: Text(a),
//     );
//   }
// }