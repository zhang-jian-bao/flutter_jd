import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';//路由模块
import './router_handler.dart';  //路由文件 detailsHandler 具体路由实现

class Routers{
  static String root = '/';
  static String detailsPage = './detail';

  static void configureRouters(Router router) {
    //配置路由 404 错误页面
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params) {
        print('错误路由');
      }
    );
    // 路由字典，路由实现方法
    router.define(detailsPage,handler: detailsHandler);  //detailsHandler  返回一个具体的组件
  }
}

// 每个知识点 都有很多解决方式   社区太活跃了