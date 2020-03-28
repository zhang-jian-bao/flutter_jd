
import './path.dart';
import 'dart:io';
import 'package:dio/dio.dart';

Future http(url,method,data) async{
  try{
    Response res;
    Dio dio=new Dio();
    // dio.options.contentType=ContentType.parse('application/x-www-form-urlencoded');
    if(method=='get'){
      if(data==null){
        res = await dio.get(pathHttp[url]);  //servicePath['homePageBanner']
      }else{
        print('data');
        res = await dio.get(pathHttp[url],queryParameters: data);
        print('fasel2');
      }
    }else{
      if(data==null){
        res=await dio.post(pathHttp[url]);
      }else{
        res=await dio.post(pathHttp[url],data:data);
      }
    }
    return res.data;

  }catch(e,s){
    print(e);
    print(s);
  }
}