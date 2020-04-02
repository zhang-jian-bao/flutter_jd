import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../provide/counter.dart';
class ShopPages extends StatefulWidget {
  ShopPages({Key key}) : super(key: key);

  @override
  _ShopPagesState createState() => _ShopPagesState();
}

class _ShopPagesState extends State<ShopPages>  {
var aa;
var moey;
 int n=0;
//  void ss1(val){
//    setState(() {
//      moey+=int.parse(val['price'])*val['num'];
//    });
//  }
//这是合计的方法，每次调用
 void ad(){
   int ao=0;//初始一个为0；否则会一直叠加
   print('价格');
   print(aa);
   for(var item in aa){

     print("这是item$item");
    if(item['check']){
       ao+=int.parse(item['price'])*item['num'];
       print("价格${item['price']}");
       print("数量${item['num']}");
    }
   }
  setState(() {
    moey=ao;
  });
 }
 @override
 void initState() { 
   super.initState();
    moey=0;
 }
bool cheall=false;//定义全选为false
//从provide中获取数据，并循环，传值
Widget ss(){
  return Provide<Counter>(
      //获取仓库数据渲染页面
      builder: (context, child, counter) {
        aa=counter.obj;
        List<Widget> wares = counter.obj.map((val) {
          return InkWell(
                child: Container(
                  padding: EdgeInsets.only(top:10,bottom:10),
                  decoration: BoxDecoration( 
              border:Border(bottom:BorderSide(width: 1,color: Color(0xffe5e5e5)) )
                  ),
                  child: Row(
              children:[
                // Text('$val')
             _cartCheckButton(val),
            _cartImage(val),
            _cartName(val),
            _cartPrice(val)
            ]
            ),
                ),
             );
        }).toList();

        return Column(children: wares);
      },
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('购物车'),),
      body: Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom:80),
          child:ListView(children: <Widget>[
            ss()
          ],),
        ),
        Positioned(
          bottom:0,
          left:0,
          child:bottom()
        )
      ],
    ),
    );
  }
  
  //购物车商品组件

  //选择商品的按钮
  Widget _cartCheckButton(val) {
    return Container(
      alignment: Alignment.center,
      child: Checkbox(
        value: val['check'],
        activeColor: Colors.pinkAccent,
        onChanged: (bool) {
         setState(() {
            val['check']=!val['check'];
             if(val['check']){
            n+=1;
            // moey+=int.parse(val['price'])*val['num'];
          }else{
            n-=1;
            // moey=0;
          }
          // print(moey);
          if(n==aa.length){
            cheall=true;
          }else{
            cheall=false;
          }
         });
         ad();
        },
      ),
    );
  }

  //商品图片
  Widget _cartImage(val) {
    return Container(
      width:80,
      height: 80,
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
      ),
      child:
      // Text('$val')
      Image.network("http://jd.itying.com/${val['pic']}"),
    );
  }

  //商品名称
  Widget _cartName(val) {
    return Container(
      width:120,
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Text("${val['title']}"),
          jia(val)
          // Text('${val['num']}'),
        ],
      ),
    );
  }
 
//加减
Widget jia(val){
  return Row(
    children: <Widget>[
      InkWell(
        onTap: (){
          setState(() {
            val['num']--;
            if(val['num']<1){//当数量小于1的时候，删除当前数据
              aa.remove(val);
            }
         
          });
         ad();
         
        },
       child:Container(
        child: Text('-',textAlign:TextAlign.center,),
         decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.grey),
          ),
          padding: EdgeInsets.all(4),
      ),
      ),
      Container(
        child: Text("${val['num']}",textAlign:TextAlign.center,),
         decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.grey),
          ),
          padding: EdgeInsets.all(4),
      ),
     InkWell(
       onTap: (){
         setState(() {
           val['num']++;
          
         });
         ad();
       },
       child:  Container(
        child: Text('+',textAlign:TextAlign.center,),
         decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.grey),
          ),
          padding: EdgeInsets.all(4),
      ),
     )
    ],
  );
}
  //商品价格
  Widget _cartPrice(val) {
    return Container(
      width: 100,
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Text("${val['price']}"),
          // Text('$val'),
          Container(//点击删除
            child: InkWell(
              onTap: (){
               setState(() {//val就是整个数组的每一项
                 aa.remove(val);
               });
              },
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
    // List<Widget> asc=[];
    // for(var val in aa){
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
    // }
    
    // return Row(children: asc,);
  }
  //全选按钮
  Widget _selectAllButton() {
    return Row(
      children: <Widget>[
        Checkbox(
          value: cheall,
          activeColor: Colors.pink,
          onChanged: (bool val) {
            setState(() {
              cheall=!cheall;
              if(cheall){
                n=aa.length;
              }else{
                n=0;
              }
            });
            for(var i=0;i<aa.length;i++){
              if(cheall){
                aa[i]['check']=true;
              }else{
                 aa[i]['check']=false;
              }
            }
          },
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
                  '￥$moey',
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