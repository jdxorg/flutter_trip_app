/**
 * 首页
 */
import 'package:flutter/material.dart';
import 'package:flutter_trip_app/widget/swiper_widget.dart';

class MyHomePage extends StatefulWidget {
  static final String sName = 'home';

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imageList;
  @override
  void initState() {
    imageList = [
      'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg',
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3485348007,2192172119&fm=26&gp=0.jpg',
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
      'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=190488632,3936347730&fm=26&gp=0.jpg',
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView(
        children: <Widget>[
          SwiperWidget(
            imageList,
            paginationMargin: const EdgeInsets.fromLTRB(0, 0, 20, 60),
            onItemTap: (index) => print('$index'),
          ),
        ],
      ),
    );
  }
}
