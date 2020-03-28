import 'package:dio/dio.dart';
// import 'dart:async';
import 'dart:io';
import './path.dart';
Future request(url,methods,data) async{
  // try{
    Response res;
    Dio dio = new Dio();
    //post 提交表单时 需要修改的请求头
    // dio.options.contentType=ContentType.parse('application/x-www-form-urlencoded');
    // Options options = Options(headers: {HttpHeaders.acceptHeader:"accept: application/json"});
    if(methods=='get'){
      if(data==null){
        res = await dio.get(pathHttp[url]);  //servicePath['homePageBanner']
      }else{
        print('data');
        res = await dio.get(pathHttp[url],queryParameters: data);
        print('fasel2');
      }
      print('over ');
    }else{
       if(data==null){
        res = await dio.post(pathHttp[url]);
      }else{
        res = await dio.post(pathHttp[url],data:data);
      }
    }
  
    return res.data;
  // }catch(e){
    print('请检查网络');
  // }
}
