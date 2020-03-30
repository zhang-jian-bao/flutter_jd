// import 'package:flutter/material.dart';
// import 'package:provide/provide.dart';//引入
// import './provide/counter.dart';

// void main(){
//     //main函数里面引用provide
//     var counter = Counter();//文件名要一致，否则报错
//     var providers =Providers();
//     providers..provide(Provider<Counter>.value(counter));
//     runApp(ProviderNode(child: MyApp(),providers: providers,));
// }

// class MyApp extends StatelessWidget{
//     @override
//     Widget build(BuildContext context){
//         return MaterialApp(
//             title: "flutter provide",
//             home: Scaffold(
//                 appBar: AppBar(
//                     title: Text("flutter provide"),
//                 ),
//                 body: Container(
//                     child:Column(
//                         children: <Widget>[
//                             GetProvideValue(),
//                             AddButton(),
//                             SubButton(),
//                         ],
//                     )
//                 ),
//             ),
//         );
//     }
// }
// //获取provide状态里面的值
// class GetProvideValue extends StatelessWidget{
//     @override
//     Widget build(BuildContext context){
//         return Container(
//             child: Provide<Counter>(                        //在其他页面也是用同样的方法可以引用到provide里面的参数
//                     builder: (context,child,counter){
//                         return Text(
//                             "${counter.value}"
//                         );
//                     },
//                 ),
//         );
//     }
// }
// //改变provide状态的值,调用provide里面的方法
// class AddButton extends StatelessWidget{
//     @override
//     Widget build(BuildContext context){
//         return RaisedButton(
//             onPressed: (){
//                 Provide.value<Counter>(context).add();
//             },
//             child: Text("增加"),
//         );
//     }
// }
// //改变provide状态的值,调用provide里面的方法
// class SubButton extends StatelessWidget{
//     @override
//     Widget build(BuildContext context){
//         return RaisedButton(
//             onPressed: (){
//                 Provide.value<Counter>(context).subtract();
//             },
//              child: Text("减少"),
//         );
//     }
// }