import '../config/http.dart';
import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  //ChangeNotifier这个组件是用来检测数据的变化
  // int value = 100;//声明变量或储存状态
  var id;
  var arr = [];
  var obj = [];
  int num = 0;
  // add(){
  //     value++;
  //     notifyListeners();        //数据变化后，这个方法会通知所有组件更新数据
  // }
  // subtract(){
  //     value--;
  //     notifyListeners();        //通知引用该变量地方的改变值
  // }
  fenLei(pid) async {
    //分类里面的右侧接口数据
    id = pid;
    print(id);
    var res = await http('HomePageSl', 'get', {"pid": id});
    // print(res);
    arr = res['result'];
    id = res['result'][0]['_id'];
    // print(arr);
    arr.forEach((item) {
      item['pic'] = item['pic'].replaceAll(new RegExp(r'\\'), '/');
    });
    notifyListeners();
  }

  addList(k) {
    print('加入购物车传递的值${k['num']}');
    var a=obj.indexWhere((val){//
      return val['_id']==k['_id'];//当找到_id时，返回下标，没有的话，返回-1
    });
    if(a!=-1){//a为返回的下标
      obj[a]['num']++;
    }else{
      obj.add(k);
    }
    print('加入购物车传递的值${k['num']}');
  }
  
  remove() {
    //删除
  }
}
