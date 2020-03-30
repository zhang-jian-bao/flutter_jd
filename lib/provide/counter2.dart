import 'package:flutter/material.dart';

class Counter with ChangeNotifier{//ChangeNotifier这个组件是用来检测数据的变化
    int value = 100;//声明变量或储存状态

    add(){
        value++;
        notifyListeners();        //数据变化后，这个方法会通知所有组件更新数据
    }
    subtract(){
        value--;
        notifyListeners();        //通知引用该变量地方的改变值
    }
}