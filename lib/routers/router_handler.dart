import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../route/fen_xq.dart';

Handler detailsHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    print(params);//{id: [3]}
    String goodsId = params['id'][0];
    print(goodsId);
    return FenXq(goodsId: goodsId);  // 返回一个该路由地址下的 组件
  }
);

