import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../config/http.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

class HomePages extends StatefulWidget {
  HomePages({Key key}) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  List arr;
  List arr2;
  List arr3;
  List ss;
  List arr1;
  int index = 1;
  bool loading = false;
  //相当于created声明周期
  void initState() {
    super.initState();
    getHttp(); //轮播图
    list1();
    JiuHttp();
  }

  //上拉
  Future list1() async {
    var pa = {
      "page": 1,
    };
    // print('000');
    var res = await http("HomePageSl", "get", pa);
    setState(() {
      arr2 = res['result'];
    });
    arr2.forEach((item) =>
        {item['pic'] = item['pic'].replaceAll(new RegExp(r'\\'), '/')});
  }

  Future loadMoreData() {
    //
    return Future.delayed(Duration(seconds: 1), () {
      setState(() {
//  this.isLoading = false;
        print('开始加载！！');
        // 触发pageNum++事件
//  nineHttp2();
        nuhttp();
      });
    });
  }

//上拉
  Future nuhttp() {
    index++;

    var da = {'page': '$index'};
    print(da);
    http("HomePageSl", "get", da).then((val) {
      //九宫格
      // print(val['result']);
      if (val['result'] == []) {
        arr2 = arr2;
//        // print('吧vv');
//        // absorb = false;
//        print(absorb);
// absorbPointer=false;
      } else {
        setState(() {
          arr3 = val['result'];
          print(arr3);
          arr2.addAll(arr3);
        });
      }
      arr2.forEach((item) {
        item['pic'] = item['pic'].replaceAll(new RegExp(r'\\'), '/');
      });
    });
  }

//下拉
  Future nutop() {
    index++;
    var da = {'page': '$index'};
    print(da);
    http("HomePageSl", "get", da).then((val) {
      setState(() {
        arr2 = val['result'];
      });
      arr2.forEach((item) {
        item['pic'] = item['pic'].replaceAll(new RegExp(r'\\'), '/');
      });
    });
  }
//arr2数据接口
  Widget ahdf() {
    List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
    for (var item in arr2) {
      tiles.add(new Container(
        width: 160,
        // height: 140,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            new Container(
              child: Image.network(
                "http://jd.itying.com/${item['pic']}",
                width: 160,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            new Container(
              child: Text(
                item['title'],
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 10, bottom: 10),
            ),
            new Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      "原价${item['old_price']}",
                      style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey[400]),
                    ),
                    // margin: EdgeInsets.all(14),
                  ),
                  Container(
                    child: Text("现价${item['price']}",
                        style: TextStyle(fontSize: 12, color: Colors.red)),
                    //  margin: EdgeInsets.all(14),
                  )
                ],
              ),
            )
          ],
        ),
      ));
    }
    return Wrap(
      children: tiles,
      spacing: 10,
      runSpacing: 20,
    );
  }

  //轮播图读取封装接口的数据
  Future getHttp() async {
    // 轮播图
    try {
      var res = await http('HomePageBanner', "get", null);
      setState(() {
        arr = res['result'];
      });
      arr.forEach((item) =>
          {item['pic'] = item['pic'].replaceAll(new RegExp(r'\\'), '/')});
    } catch (e) {
      print(e);
    }
  }

  //轮播图布局
  Widget ban(BuildContext context) {
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          "http://jd.itying.com/${arr[index]['pic']}", //通过下标得到当前图片的路径
          fit: BoxFit.fill,
        );
      },
      autoplay: true,
      loop: true,
      itemCount: 3,
      pagination: new SwiperPagination(),
      // control: new SwiperControl(),
    );
  }

  var list = ['images/banner.jpg', 'images/banner.jpg', 'images/banner.jpg'];

//上拉列表数据接口
  Future JiuHttp() async {
    //热门推荐
    var res = await http("HomePageShopList", "get", null);
    setState(() {
      arr1 = res['result'];
    });
    arr1.forEach((item) {
      item['pic'] = item['pic'].replaceAll(new RegExp(r'\\'), '/');
    });
  }

  //自定义封装商品列表循环渲染的组件方法，比下面的简单一点
  Widget buildGrid() {
    List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
    for (var item in arr1) {
      tiles.add(new Container(
        width: 160,
        // height: 140,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            new Container(
              child: new FadeInImage.assetNetwork(
                //占位图
                placeholder: 'images/1.jpg',
                image: 'http://jd.itying.com/${item['pic']}',
                width: 140,
                height: 140,
                fit: BoxFit.fitWidth,
              ),
            ),
            new Container(
              child: Text(
                item['title'],
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
              margin: EdgeInsets.all(10),
            ),
            new Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      "原价${item['old_price']}",
                      style: TextStyle(fontSize: 12),
                    ),
                    margin: EdgeInsets.all(14),
                  ),
                  Container(
                    child: Text("现价${item['price']}",
                        style: TextStyle(fontSize: 12, color: Colors.red)),
                    margin: EdgeInsets.all(14),
                  )
                ],
              ),
            )
          ],
        ),
      ));
    }
    return Wrap(
      children: tiles,
      spacing: 10,
      runSpacing: 20,
    );
  }
 Widget buildGrid123() {
    List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
    for (var item in arr2) {
      tiles.add(new Container(
        width: 160,
        // height: 140,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            new Container(
              child: new FadeInImage.assetNetwork(
                //占位图
                placeholder: 'images/1.jpg',
                image: 'http://jd.itying.com/${item['pic']}',
                width: 140,
                height: 140,
                fit: BoxFit.fitWidth,
              ),
            ),
            new Container(
              child: Text(
                item['title'],
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
              margin: EdgeInsets.all(10),
            ),
            new Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      "原价${item['old_price']}",
                      style: TextStyle(fontSize: 12),
                    ),
                    margin: EdgeInsets.all(14),
                  ),
                  Container(
                    child: Text("现价${item['price']}",
                        style: TextStyle(fontSize: 12, color: Colors.red)),
                    margin: EdgeInsets.all(14),
                  )
                ],
              ),
            )
          ],
        ),
      ));
    }
    return Wrap(
      children: tiles,
      spacing: 10,
      runSpacing: 20,
    );
  }
  //自定义红杠加热门推荐组件
  Widget hot = new Container(
      //上方的文字，推荐列表及红杠布局
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(40),
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: <Widget>[
          new Container(
            decoration:
                BoxDecoration(border: Border.all(width: 2, color: Colors.red)),
            margin: EdgeInsets.only(left: 20, right: 20),
          ),
          new Container(
            child: Text('热门推荐'),
          )
        ],
      ));

  //map循环列表渲染
  Widget shop_list() {
    if (arr1.length != 0) {
      List<Widget> shop = arr1.map((val) {
        return InkWell(
            child: new Container(
          width: 160,
          // height: 140,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.network(
                  "http://jd.itying.com/${val['pic']}",
                  width: 160,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              new Container(
                child: Text(
                  val['title'],
                  style: TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 10, bottom: 10),
              ),
              new Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "原价${val['old_price']}",
                        style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey[400]),
                      ),
                      // margin: EdgeInsets.all(14),
                    ),
                    Container(
                      child: Text("现价${val['price']}",
                          style: TextStyle(fontSize: 12, color: Colors.red)),
                      //  margin: EdgeInsets.all(14),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              )
            ],
          ),
        ));
      }).toList();
      return Wrap(
        children: shop,
        spacing: 10,
        runSpacing: 20,
      );
    } else {
      Text('暂无数据~');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '百姓生活+',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent[400],
        ),
        body: EasyRefresh(
          firstRefresh: true,
          header: MaterialHeader(),
          footer: ClassicalFooter(
              bgColor: Colors.white,
              textColor: Colors.black,
              infoColor: Colors.blue,
              showInfo: true,
              loadText: '上拉加载',
              loadReadyText: '松开后开始加载',
              infoText: '加载中。。。',
              loadedText: '加载完成',
              noMoreText: '没有更多数据了~'),
          onRefresh: () async {
            print('下拉刷新');
            nutop(); //下拉的时候，数据替换arr
          },
          onLoad: () async {
            
            print('上拉加载');
            // this.isLoading = true;

             this.loadMoreData();
          },
          child: new ListView(
            children: <Widget>[
              //轮播图布局
              new Container(
                //轮播图
                child: ban(context),
                height: ScreenUtil().setHeight(356), //适配屏幕大小
                width: ScreenUtil().setWidth(750), //适配屏幕大小
              ),
              //分类布局
              new Container(
                child: Banner_Fen(), //调用wrap布局
                margin: EdgeInsets.only(top: 10),
              ),
              //广告布局
              new Container(
                //广告
                child: Image.asset(
                  'images/12.jpg',
                  width: ScreenUtil().setWidth(642),
                  height: ScreenUtil().setHeight(76),
                ),
                margin: EdgeInsets.all(10),
              ),
              //商品列表
              new Container(
                //   //热门推荐
                child: Column(
                  children: <Widget>[
                    hot, //这是组件，不是方法，所以不用加（），调用热门推荐组件
                    buildGrid() //调用商品列表的循环渲染组件方法
                    // shop_list()//调用map的方法循环列表并渲染
                  ],
                ),
              ),
              // ),
              //调用上拉加载数据
              new Container(
                margin: EdgeInsets.only(top:10),
                child: Column(
                  children: <Widget>[
                     buildGrid123()
                  ],
                ),
              )
              //上拉加载显示样式
              // new Container(
              //   // child: renderBottom(),
              // )
            ],
          ),
        ));
  }
}

//猜你喜欢布局
class CaiNi_love extends StatefulWidget {
  CaiNi_love({Key key}) : super(key: key);

  @override
  _CaiNi_loveState createState() => _CaiNi_loveState();
}

class _CaiNi_loveState extends State<CaiNi_love> {
  var arr2;
  @override
  void initState() {
    super.initState();
    Cai_you_love();
  }

  //猜你喜欢接口
  Future Cai_you_love() async {
    var res = await http('HomePageShophot', 'get', null);
    setState(() {
      arr2 = res['result'];
    });
    arr2.forEach((item) =>
        {item['pic'] = item['pic'].replaceAll(new RegExp(r'\\'), '/')});
  }

  //自定义红杠加猜你喜欢组件
  Widget hot_you = new Container(
      //上方的文字，推荐列表及红杠布局
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(40),
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: <Widget>[
          new Container(
            decoration:
                BoxDecoration(border: Border.all(width: 2, color: Colors.red)),
            margin: EdgeInsets.only(left: 20, right: 20),
          ),
          new Container(
            child: Text('猜你喜欢'),
          )
        ],
      ));

  //自定义组件循环接口数据并渲染页面和布局
  //map循环列表渲染
  Widget buildGrid() {
    List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
    for (var item in arr2) {
      tiles.add(new Container(
        width: 160,
        // height: 140,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            new Container(
              child: Image.network(
                "http://jd.itying.com/${item['pic']}",
                width: 160,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            new Container(
              child: Text(
                item['title'],
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 10, bottom: 10),
            ),
            new Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      "原价${item['old_price']}",
                      style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey[400]),
                    ),
                    // margin: EdgeInsets.all(14),
                  ),
                  Container(
                    child: Text("现价${item['price']}",
                        style: TextStyle(fontSize: 12, color: Colors.red)),
                    //  margin: EdgeInsets.all(14),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            )
          ],
        ),
      ));
    }
    return Wrap(
      children: tiles,
      spacing: 10,
      runSpacing: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          hot_you,
          buildGrid()
          //  new Container(
          //    child: Text("arr2[0]['title']"),
          //  )
        ],
      ),
    );
  }
}

//热门推荐布局
class Hot_tui extends StatefulWidget {
  // Hot_tui({Key key}) : super(key: key);

  @override
  _Hot_tuiState createState() => _Hot_tuiState();
}

class _Hot_tuiState extends State<Hot_tui> {
  List arr1;
  // void initState() {
  //   super.initState();
  //   JiuHttp();

  // }

  Future JiuHttp() async {
    //热门推荐
    var res = await http("HomePageShopList", "get", null);
    setState(() {
      arr1 = res['result'];
    });
    arr1.forEach((item) {
      item['pic'] = item['pic'].replaceAll(new RegExp(r'\\'), '/');
    });
  }

  //自定义封装商品列表循环渲染的组件方法，比下面的简单一点
  Widget buildGrid() {
    List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
    for (var item in arr1) {
      tiles.add(new Container(
        width: 160,
        // height: 140,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            new Container(
              child: new FadeInImage.assetNetwork(
                //占位图
                placeholder: 'images/1.jpg',
                image: 'http://jd.itying.com/${item['pic']}',
                width: 140,
                height: 140,
                fit: BoxFit.fitWidth,
              ),
            ),
            new Container(
              child: Text(
                item['title'],
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
              margin: EdgeInsets.all(10),
            ),
            new Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      "原价${item['old_price']}",
                      style: TextStyle(fontSize: 12),
                    ),
                    margin: EdgeInsets.all(14),
                  ),
                  Container(
                    child: Text("现价${item['price']}",
                        style: TextStyle(fontSize: 12, color: Colors.red)),
                    margin: EdgeInsets.all(14),
                  )
                ],
              ),
            )
          ],
        ),
      ));
    }
    return Wrap(
      children: tiles,
      spacing: 10,
      runSpacing: 20,
    );
  }

  //自定义红杠加热门推荐组件
  Widget hot = new Container(
      //上方的文字，推荐列表及红杠布局
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(40),
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: <Widget>[
          new Container(
            decoration:
                BoxDecoration(border: Border.all(width: 2, color: Colors.red)),
            margin: EdgeInsets.only(left: 20, right: 20),
          ),
          new Container(
            child: Text('热门推荐'),
          )
        ],
      ));

  //map循环列表渲染
  Widget shop_list() {
    if (arr1.length != 0) {
      List<Widget> shop = arr1.map((val) {
        return InkWell(
            child: new Container(
          width: 160,
          // height: 140,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.network(
                  "http://jd.itying.com/${val['pic']}",
                  width: 160,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              new Container(
                child: Text(
                  val['title'],
                  style: TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 10, bottom: 10),
              ),
              new Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "原价${val['old_price']}",
                        style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey[400]),
                      ),
                      // margin: EdgeInsets.all(14),
                    ),
                    Container(
                      child: Text("现价${val['price']}",
                          style: TextStyle(fontSize: 12, color: Colors.red)),
                      //  margin: EdgeInsets.all(14),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              )
            ],
          ),
        ));
      }).toList();
      return Wrap(
        children: shop,
        spacing: 10,
        runSpacing: 20,
      );
    } else {
      Text('暂无数据~');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        hot, //这是组件，不是方法，所以不用加（），调用热门推荐组件
        // buildGrid()//调用商品列表的循环渲染组件方法
        shop_list() //调用map的方法循环列表并渲染
      ],
    );
  }
}

//wrap布局 轮播图下的分类
class Banner_Fen extends StatefulWidget {
  Banner_Fen({Key key}) : super(key: key);

  @override
  _Banner_FenState createState() => _Banner_FenState();
}

//wrap 布局导航分类
class _Banner_FenState extends State<Banner_Fen> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 18,
      runSpacing: 10,
      children: <Widget>[
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset('images/4.jpg',
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setHeight(80)),
              ),
              new Container(
                child: Text(
                  '白酒',
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
          width: ScreenUtil().setWidth(120),
          height: ScreenUtil().setHeight(130),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset('images/5.jpg',
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setHeight(80)),
              ),
              new Container(
                child: Text(
                  '啤酒',
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
          width: ScreenUtil().setWidth(120),
          height: ScreenUtil().setHeight(130),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset('images/6.jpg',
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setHeight(80)),
              ),
              new Container(
                child: Text(
                  '葡萄酒',
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
          width: ScreenUtil().setWidth(120),
          height: ScreenUtil().setHeight(130),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset('images/7.jpg',
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setHeight(80)),
              ),
              new Container(
                child: Text(
                  '清酒洋酒',
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
          width: ScreenUtil().setWidth(120),
          height: ScreenUtil().setHeight(130),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset('images/8.jpg',
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setHeight(80)),
              ),
              new Container(
                child: Text(
                  '保健酒',
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
          width: ScreenUtil().setWidth(120),
          height: ScreenUtil().setHeight(130),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset('images/9.jpg',
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setHeight(80)),
              ),
              new Container(
                child: Text(
                  '预调酒',
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
          width: ScreenUtil().setWidth(120),
          height: ScreenUtil().setHeight(130),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset('images/10.jpg',
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setHeight(80)),
              ),
              new Container(
                child: Text(
                  '下酒小菜',
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
          width: ScreenUtil().setWidth(120),
          height: ScreenUtil().setHeight(130),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset('images/11.jpg',
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setHeight(80)),
              ),
              new Container(
                child: Text(
                  '饮料',
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
          width: ScreenUtil().setWidth(120),
          height: ScreenUtil().setHeight(130),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset('images/14.jpg',
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setHeight(80)),
              ),
              new Container(
                child: Text(
                  '乳制品',
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
          width: ScreenUtil().setWidth(120),
          height: ScreenUtil().setHeight(130),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset('images/13.jpg',
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setHeight(80)),
              ),
              new Container(
                child: Text(
                  '休闲零食',
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
          width: ScreenUtil().setWidth(120),
          height: ScreenUtil().setHeight(130),
        ),
      ],
    );
  }
}

//flex布局 轮播图下的分类
class My_flex extends StatefulWidget {
  My_flex({Key key}) : super(key: key);

  @override
  _My_flexState createState() => _My_flexState();
}

class _My_flexState extends State<My_flex> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Container(
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    new Container(
                      child: Image.asset(
                        'images/4.jpg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    new Container(
                      child: Text(
                        '白酒',
                        style: TextStyle(fontSize: 10),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    new Container(
                      child: Image.asset(
                        'images/5.jpg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    new Container(
                      child: Text(
                        '啤酒',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    new Container(
                      child: Image.asset(
                        'images/6.jpg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    new Container(
                      child: Text(
                        '葡萄酒',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    new Container(
                      child: Image.asset(
                        'images/7.jpg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    new Container(
                      child: Text(
                        '清酒洋酒',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    new Container(
                      child: Image.asset(
                        'images/8.jpg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    new Container(
                      child: Text(
                        '保健酒',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          margin: EdgeInsets.only(top: 10),
        ),
        new Container(
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    new Container(
                      child: Image.asset(
                        'images/9.jpg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    new Container(
                      child: Text(
                        '预调酒',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    new Container(
                      child: Image.asset(
                        'images/10.jpg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    new Container(
                      child: Text(
                        '下酒小菜',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    new Container(
                      child: Image.asset(
                        'images/11.jpg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    new Container(
                      child: Text(
                        '饮料',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    new Container(
                      child: Image.asset(
                        'images/13.jpg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    new Container(
                      child: Text(
                        '乳制品',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    new Container(
                      child: Image.asset(
                        'images/14.jpg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    new Container(
                      child: Text(
                        '休闲零食',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          margin: EdgeInsets.only(top: 10),
        )
      ],
    );
  }
}

//九宫格布局第一种 导航分类
class JiuGunGe_one extends StatefulWidget {
  JiuGunGe_one({Key key}) : super(key: key);

  @override
  _JiuGunGe_oneState createState() => _JiuGunGe_oneState();
}

class _JiuGunGe_oneState extends State<JiuGunGe_one> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, //每行显示五条数据
          mainAxisSpacing: 10, //上下间距
          crossAxisSpacing: 10, //左右间距
          childAspectRatio: 1.0 //宽高比例1:0
          ),
      children: <Widget>[
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/4.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '白酒',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/5.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '啤酒',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/6.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '葡萄酒',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/7.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '清酒洋酒',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/8.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '保健酒',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/9.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '预调酒',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/10.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '下酒小菜',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/11.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '饮料',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/14.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '乳制品',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/13.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '休闲零食',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

//九宫格布局 导航分类 第二种
class JiuGunGe_two extends StatefulWidget {
  JiuGunGe_two({Key key}) : super(key: key);

  @override
  _JiuGunGe_twoState createState() => _JiuGunGe_twoState();
}

class _JiuGunGe_twoState extends State<JiuGunGe_two> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5, //每行显示5条数据
      crossAxisSpacing: 10, //左右间距
      mainAxisSpacing: 10, //上下间距
      children: <Widget>[
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/4.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '白酒',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/5.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '啤酒',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/6.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '葡萄酒',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/7.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '清酒洋酒',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/8.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '保健酒',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/9.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '预调酒',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/10.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '下酒小菜',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/11.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '饮料',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/14.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '乳制品',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        new Container(
          child: Column(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/13.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              new Container(
                child: Text(
                  '休闲零食',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
