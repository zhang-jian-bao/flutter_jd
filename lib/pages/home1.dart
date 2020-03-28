import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePages extends StatefulWidget {
  HomePages({Key key}) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  var list = ['images/banner.jpg', 'images/banner.jpg', 'images/banner.jpg'];
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
      body: new ListView(
        children: <Widget>[
          new Container(
            //轮播图
            child: new Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.asset(
                  this.list[index], //通过下标得到当前图片的路径
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              loop: true,
              itemCount: 3,
              pagination: new SwiperPagination(),
              // control: new SwiperControl(),
            ),
            height: 200,
            width: double.infinity,
          ),
          // new Container(
          //     //分类
          //     child: Padding(
          //   padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          //   child: Banner_Fen(),
          // )),
          new Container(
            child: JiuGunGe_two(),//调用九宫格第二种方法
          ),
          new Container(
            //广告
            child: Image.asset('images/12.jpg'),
            margin: EdgeInsets.all(20),
          ),
          
          
        ],
      ),
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
      spacing: 26,
      runSpacing: 10,
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
    margin: EdgeInsets.only(top:10),
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
    margin: EdgeInsets.only(top:10),
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
    return  GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,//每行显示五条数据
          mainAxisSpacing: 10,//上下间距
          crossAxisSpacing: 10,//左右间距
          childAspectRatio: 1.0//宽高比例1:0
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
      crossAxisCount: 5,//每行显示5条数据
      crossAxisSpacing: 10,//左右间距
      mainAxisSpacing: 10,//上下间距
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
