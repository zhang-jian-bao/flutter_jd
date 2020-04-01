import 'package:anli/config/http1.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import '../config/http.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provide/provide.dart'; //引入provide仓库
import "../provide/counter.dart";
class FenXq extends StatefulWidget {
  FenXq({Key key,this.goodsId}) : super(key: key);
  var goodsId;
  @override
  _FenXqState createState() => _FenXqState();
}

class _FenXqState extends State<FenXq> {
  
  var args;
 var arr;
 bool load=false;
  bool loadd=false;
  bool gg=false;
  List acc=[];
  @override
  void initState() { 
    super.initState();
    args=widget.goodsId;
    print(args+'id值');
    getRoute(args);
  }
 //传入id值，读取接口
  Future getRoute(id) async{
    // print("详情页获取$e");
    // var res;
    // var dio=new Dio();
    // res= await dio.get("http://jd.itying.com/api/pcontent",queryParameters:{'id':e});
    // print(res);
    //  if(this.mounted){
    //     setState(() {
    //        arr = res['result'];
    //      });
    //  }
    // // print("$arr+1111111111");
    // arr.forEach((item){
    //   item['pic'] = item['pic'].replaceAll(new RegExp(r'\\'), '/');
    //   });
 
var res= await Dio().get('http://jd.itying.com/api/pcontent?id='+id);
           res.data["result"]["pic"] = res.data["result"]["pic"].replaceAll(new RegExp(r'\\'), '/');
    if(this.mounted){
      setState(() {
        this.arr=res.data["result"];
    });
  load=true;
    }
    print(res);
     
  }
  //刚开始加载动画
  Widget _loadMoreWidget() {
      //还有更多数据可以加载
      return Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("加载中......"),
              CircularProgressIndicator(
                strokeWidth: 1,
              )
            ],
          ),
        ),
      );
    }
  //上部分的图片
  Widget top(){
    if(load){
      return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child:  Column(
      children: <Widget>[
        Container(
          child: Image.network("http://jd.itying.com/${arr['pic']}", fit: BoxFit.fill),
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setHeight(500),
          padding: EdgeInsets.all(20),
        ),
        Container(
          child: Text("${arr['title']}"),
          alignment: Alignment.centerLeft,
        ),
        Container(
          margin: EdgeInsets.only(top:10),
          child: Row(
            children: <Widget>[
              Container(
                child: Text("${arr['old_price']}",style: TextStyle(color: Colors.red,fontSize: 20),),
                margin: EdgeInsets.only(right:10,),
              ),
              Text("市场价${arr['price']}",style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),)
            ],
          ),
        )
      ],
    ),
    );
    }else{
      Text('加载中。。。');
    }
  }
  Widget top1(res){
    if(load){
      return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child:  Column(
      children: <Widget>[
        Container(
          child: Image.network("http://jd.itying.com/${res['pic']}", fit: BoxFit.fill),
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setHeight(500),
          padding: EdgeInsets.all(20),
        ),
        Container(
          child: Text("${res['title']}"),
          alignment: Alignment.centerLeft,
        ),
        Container(
          margin: EdgeInsets.only(top:10),
          child: Row(
            children: <Widget>[
              Container(
                child: Text("${res['old_price']}",style: TextStyle(color: Colors.red,fontSize: 20),),
                margin: EdgeInsets.only(right:10,),
              ),
              Text("市场价${res['price']}",style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),)
            ],
          ),
        )
      ],
    ),
    );
    }else{
      Text('加载中。。。');
    }
  }
  //中部
  Widget middle(){
    return Container(
      height: ScreenUtil().setHeight(90),
      margin: EdgeInsets.only(top:10,bottom:10),
      color: Colors.white,
      padding: EdgeInsets.only(left:10),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Text('说明：',style: TextStyle(color:Colors.red),),
          Text('>极速送达',style: TextStyle(color:Colors.red),),
          Text('>正品保证',style: TextStyle(color:Colors.red),),
        ],
      ),
    );
  }
  //详情
  var arr1=[
    {"name":'详情',"id":0},
    {"name":'评论',"id":1},
  ];
  var id=0;
  //详情布局
  Widget bottom(){
    List<Widget> shop=[];
    for (var item in arr1) {
      shop.add(
         Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  setState(() {
                    id=item['id'];
                  });
                },
                child: Container(
                child: Text("${item['name']}",
                style: TextStyle(color: item['id']==id?Colors.red:Colors.grey),
                ),
                alignment: Alignment.center,
              ),
              )
              )
       );
    }
    return Flex(direction: Axis.horizontal,children: shop,);
  }
 //定位加入购物车
 Widget fiex(){
   return Positioned(
     bottom: 0,
     left: 0,
     child: Container(
       height: ScreenUtil().setHeight(120),
       width: ScreenUtil().setWidth(750),
       color: Colors.white,
       child: Flex(
         direction: Axis.horizontal,
         children: <Widget>[
            Expanded(
             flex: 2,
             child:Column(
               children: <Widget>[
                 Icon(Icons.new_releases,color: Colors.green,),
                 Text('客服')
               ],
             )
             ),
           Expanded(
             flex: 2,
             child:GestureDetector(
               onTap: (){
                 setState(() {
                   loadd=!loadd;
                 });
               },
               child: Container(
               child: Column(
                 children: <Widget>[
                   Icon(Icons.shopping_cart,color: Colors.white,),
                   Text('加入购物车',style: TextStyle(color:Colors.white),)
                 ],
               ),
               color: Colors.red,
               height: double.infinity,
               width: double.infinity,
               alignment: Alignment.center,
             ),
             
             )
            ),
          Expanded(
            flex: 2,
            child:InkWell(
              onTap: (){

              },
              child:Container(
               child: Column(
                 children: <Widget>[
                   Icon(Icons.group,color: Colors.white,),
                   Text('立即购买',style: TextStyle(color:Colors.white),)
                 ],
               ),
               color: Colors.orange,
               height: double.infinity,
               width: double.infinity,
               alignment: Alignment.center,
             ),
            )
            )
         ],
       
       )
     )
     );
 }
 //类型数据渲染使用flutter_html插件一步解决
 Widget xh(){
  return Container(
     child: Html(data: arr['content']),
   );
  
 }
 //类型如颜色等规格属性循环并渲染,用传值达到循环嵌套
 Widget co(){
   List<Widget> cc=[];
   for(var val in arr['attr']){
     cc.add(
        Row(
       children:<Widget>[
          Container(
            // height: 300,
            // color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Text("${val['cate']}:",style: TextStyle(
            color: Colors.red,
            fontSize: 16,
            ),),
          ),
          dem(val['list'])
       ],
     )
     );
   }
   return Column(children: cc,);
 }
 Widget dem(res){
    List<Widget> dd=[];
   for(var val in res){
     dd.add(
       InkWell(
         onTap: (){
           setState(() {
             this.gg=!this.gg;
           });
           
           res.forEach((item){
             print(item);
             acc.remove(item);
           });
           acc.add(val);
           print(acc);
         },
         child:Container(
         child: Text('$val',style: TextStyle(
           color: acc.contains(val)?Colors.red:Colors.black)
           ,),
         decoration: BoxDecoration(
           border: Border.all(width: 1,color:Colors.grey)
         ),
         margin: EdgeInsets.only(left:10),
         padding: EdgeInsets.all(4),
       )
       )
     );
   }
   return Row(children: dd,);
 }
 //弹出框
 Widget tan(){
   if(loadd){
     return Positioned(
         left: 0,
         right: 0,
         top: 0,
         bottom: 0,
         child: Container(
           width: double.infinity,
           height: double.infinity,
           color: Colors.black12,
           child: Container(
             width:  double.infinity,
             height: 500,
             margin: EdgeInsets.only(top:300),
             decoration: BoxDecoration(
               border: Border.all(width:1,color: Colors.red)
             ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 217,
                  color: Colors.white,
                  child: co(),
                ),
               Flex(
                 direction: Axis.horizontal,
                 children: <Widget>[
                   Expanded(
                     flex: 1,
                     child: InkWell(
                  onTap:(){
                    print('加入购物车成功');
                   setState(() {
                      loadd=false;
                      acc=[];
                   });
                    Provide.value<Counter>(context).addList(arr);
                   showToast('加入购物车成功');
                  },
                  child: Container(
                      height: 40,
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Text('加入购物车',style: TextStyle(color: Colors.white),),
                  ),
                  ),
                   
                   ),
                    Expanded(
                      flex: 1,
                      child:  InkWell(
                  onTap:(){
                    print('立即购买');
                  },
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    color: Colors.orange,
                    child: Text('立即购买',style: TextStyle(color: Colors.white),),
                  ),
                  )
                    
                    )
                 ],
               )
              ],
            ),
           ),
         )
         );
   }else{
     return Text('cao');
   }
 }
  @override
  Widget build(BuildContext context) {
    // args=ModalRoute.of(context).settings.arguments;
    // getRoute();
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情页'),
      ),
      body: 
      // FutureBuilder(
      //       future: request('As','get', {"id":widget.goodsId}),
      //       builder: (context,res){
      //         if(res.data==null){
      //           _loadMoreWidget();
      //         }else{
      //            res.data["pic"] = res.data["result"]["pic"].replaceAll(new RegExp(r'\\'), '/');
      //           return  Container(
      //              child: top1(res.data['result']),
      //             //  child: Text("${res.data['title']}"),
      //            );
      //         }
      //       }
      //       ),
       Stack(
        children: <Widget>[
         
          ListView(
        children: <Widget>[
          Container(
            child:Column(
              children: <Widget>[
                 arr==null?_loadMoreWidget():top(),
                 middle(),
                 Container(
                   child: bottom(),
                   height: ScreenUtil().setHeight(90),
                   color: Colors.white,
                 ),
                 xh(),
                 
              ],
            ),
            color: Colors.grey[100],
          )
        ],
      ),
          fiex(),//底部固定定位布局
          tan(),
        ],
      )
      
    );
  }
  
}
