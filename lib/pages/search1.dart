
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/http.dart';
// import 'package:dio/dio.dart';


class SearchPages extends StatefulWidget {
  SearchPages({Key key}) : super(key: key);

  @override
  _SearchPagesState createState() => _SearchPagesState();
}

class _SearchPagesState extends State<SearchPages> {
  List arr1;
  List arr2;
  List arr3;
  String _pid;
//  List arr=['白酒','啤酒','葡萄酒','清酒洋酒','保健酒','预调酒','下酒小菜','饮料','乳制品','休闲零食','粮油调味'];
//相当于created声明周期
  void initState() { 
    super.initState();
    list();
    list2();
  }

 //左侧列表接口数据
  Future list() async{
    var res=await http('HomePageSl', 'get', null);
    // print(res);
    Object all={
      'title':'全部',
      '_id':' 59f1e1ada1da8b15d42234e9'
    };
    res['result'].insert(0,all);
     setState(() {
      arr1 = res['result'];
    });
    arr1.forEach((item){
      item['pic'] = item['pic'].replaceAll(new RegExp(r'\\'), '/');
      });
  }
  //右侧下的列表数据
   Future list2() async{
    var res=await http('HomePageSl', 'get', {"pid":_pid});
    print(res);
     setState(() {
      arr2 = res['result'];
    });
    arr2.forEach((item){
      item['pic'] = item['pic'].replaceAll(new RegExp(r'\\'), '/');
      });
  }
//循环左侧列表数据，并循环渲染
    Widget leftlist(){
      List<Widget> list1=[];
      for(var val in arr1){
        list1.add(
          GestureDetector(
            onTap: (){
              setState(() {
                _pid="${val['_id']}";
              });
              list2();
              // print(_pid);
            },
            child:new Container(
            child: new Text("${val['title']}",
              style: TextStyle(
                color: val['_id']==_pid?Colors.red:Colors.grey
              ),
            ),
            width: ScreenUtil().setWidth(190),
            height: ScreenUtil().setHeight(150),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom:BorderSide(
                  width: .5,
                  color: Colors.grey[300]
                ),
                right:BorderSide(
                  width: .5,
                  color: Colors.grey[300]
                )
                )
            ),
          ) ,
            )
          

        );
        // print('$val');
      }
      return ListView(children:list1,);
    }
   //右侧上部分的数据列表，左右滚动
    Widget leftlist1(){
      List<Widget> list1=[];
      for(var val in arr1){
        list1.add(
          new Container(
            child: new Text("${val['title']}",
            style: TextStyle(
              color:val['_id']==_pid?Colors.red:Colors.grey
              ),
            ),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
          )

        );
        print('$val');
      }
      return Row(children:list1,);
    }
  //右侧下边数据列表
 Widget rightlist(){
      List<Widget> list2=[];
      for(var val in arr2){
        list2.add(
          new Container(
            child: Row(
              children: <Widget>[
                Image.network("http://jd.itying.com/${val['pic']}",
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setHeight(100),
                  
                ),
                Column(
                  children: <Widget>[
                   new Container(
                     child:  Text("${val['title']}"),
                     margin: EdgeInsets.only(left:20),
                   )
                    // Text("${val['title']}")
                  ],
                )
              ],
            ),
            padding: EdgeInsets.all(10),
          )

        );
        print('$val');
      }
      return ListView(children:list2,);
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品分类',style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.redAccent[400],
      ),
      body: Container(
        child: Flex(
          direction:Axis.horizontal,//左右排列
          children: <Widget>[
            Expanded(
              flex:2,
              child:leftlist()
              ),
            Expanded(
              flex: 8,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        // Text('全部'),
                        leftlist1()
                        ],
                    )
                    ),
                    Expanded(
                    flex:9,
                    child:rightlist()
                    )
                ],
                )
            )
          ],
          )
      )
    );
  }
}



