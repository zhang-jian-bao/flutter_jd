// import 'package:anli/provide/counter.dart';
// import 'package:flutter/material.dart';
// import 'package:provide/provide.dart'; //引入provide仓库
// import '../provide/counter.dart';

// class TestPages extends StatefulWidget {
//   TestPages({Key key}) : super(key: key);

//   @override
//   _TestPagesState createState() => _TestPagesState();
// }

// class _TestPagesState extends State<TestPages> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('测试'),
//       ),
//       body: new ListView(
//         children: <Widget>[
//           Provide<Counter>(
//             //在其他页面也是用同样的方法可以引用到provide里面的参数
//             builder: (context, child, counter) {
//               return Text("${counter.value}");
//             },
//           ),
//           Text('增加')
//         ],
//       ),
//     );
//   }
// }

// //传参
// // class Son extends StatefulWidget {
// //   Son({Key key,}) : super(key: key);

// //   @override
// //   _SonState createState() => _SonState();
// // }

// // class _SonState extends State<Son> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //        child: child,
// //     );
// //   }
// // }
