import 'package:flutter/material.dart';


void main() {
   runApp(MyApp());
}
class MyApp extends StatefulWidget{
  _MyApp createState()=> _MyApp();
  
}
// 父组件
class _MyApp extends State<MyApp>{
  Map detail={'name':"炮哥",'age':'38'};       //数据为map类型
 
  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:Deta(obj:detail) ,
        ),
    );
  }
}

//子组件
class Deta extends StatefulWidget{
  Deta({Key key, this.obj}) : super(key: key);
  dynamic obj;
  _DetaState createState()=> _DetaState();
}
class _DetaState extends State<Deta>{
  
  @override
  void initState() {
    super.initState();
    var dd=widget.obj;
    print('传递值2222$dd');
  }
  @override
  Widget build(BuildContext context) {
    // print(context.obj);
    return Container(child: Text('${widget.obj}'),);
  }
}