
import '../config/http.dart';
import 'package:flutter/material.dart';

class Counter with ChangeNotifier{//ChangeNotifier这个组件是用来检测数据的变化
    // int value = 100;//声明变量或储存状态
    var id;
    var arr=[];
    // add(){
    //     value++;
    //     notifyListeners();        //数据变化后，这个方法会通知所有组件更新数据
    // }
    // subtract(){
    //     value--;
    //     notifyListeners();        //通知引用该变量地方的改变值
    // }
    fenLei(pid) async{
      id=pid;
      print(id);
       var res=await http('HomePageSl', 'get', {"pid":id});
      // print(res);
      arr = res['result'];
      id=res['result'][0]['_id'];
      // print(arr);
      arr.forEach((item){
        item['pic'] = item['pic'].replaceAll(new RegExp(r'\\'), '/');
        });
         notifyListeners(); 
      }
}