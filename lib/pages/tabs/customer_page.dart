/**
 * 客服
 */
import 'package:flutter/material.dart';
import 'package:flutter_trip_app/widget/search_bar_widget.dart';
import 'dart:math' as math;
import 'package:flutter_trip_app/pages/widget/home/menu.dart';
class MyCustomer extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<MyCustomer> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text('MyCustomer'),
      // ),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            // leading: GestureDetector(
            //   child: Icon(Icons.arrow_back),
            //   onTap: () => Navigator.pop(context),
            // ), 
            automaticallyImplyLeading: true,
            // title: Text('大标题'), //标题
            centerTitle: true, //标题是否居中
            actions: [Icon(Icons.archive)], //右侧的内容和点击事件啥的
            elevation: 4, //阴影的高度
            forceElevated: false, //是否显示阴影
            backgroundColor: Colors.green, //背景颜色
            brightness: Brightness.dark, //黑底白字，lignt 白底黑字
            iconTheme: IconThemeData(
                color: Colors.red,
                size: 30,
                opacity: 1), //所有的icon的样式,不仅仅是左侧的，右侧的也会改变
            textTheme: TextTheme(), //字体样式
            // primary: true, // appbar是否显示在屏幕的最上面，为false是显示在最上面，为true就显示在状态栏的下面
            titleSpacing: 16, //标题两边的空白区域
            expandedHeight: 600.0, //默认高度是状态栏和导航栏的高度，如果有滚动视差的话，要大于前两者的高度
            floating: true, //滑动到最上面，再滑动是否隐藏导航栏的文字和标题等的具体内容，为true是隐藏，为false是不隐藏
            pinned: true, //是否固定导航栏，为true是固定，为false是不固定，往上滑，导航栏可以隐藏
            snap:
                false, //只跟floating相对应，如果为true，floating必须为true，也就是向下滑动一点儿，整个大背景就会动画显示全部，网上滑动整个导航栏的内容就会消失
            flexibleSpace: new FlexibleSpaceBar(
              title: Column(
                children: <Widget>[
                  new SearchBarWidget()
                ],
              ),
              centerTitle: true,
              collapseMode: CollapseMode.pin,
            ),
          ),
          // SliverPersistentHeader(
          //   pinned: false,
          //   floating: true,
          //   delegate: _SliverAppBarDelegate(
          //     minHeight: 0.0,
          //     maxHeight: 280.0,
          //     child: HomeMenu(),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: new SearchBarWidget(),
          // ),
          new SliverFixedExtentList(
            itemExtent: 150.0,
            delegate:
                new SliverChildBuilderDelegate((context, index) => new ListTile(
                      title: new Text("List item $index"),
                    )),
          )
        ],
      ),
    );
  }
  @override 
  bool get wantKeepAlive => true;

  @override 
  void initState(){
    super.initState();
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
 
  final double minHeight;
  final double maxHeight;
  final Widget child;
 
  @override
  double get minExtent => minHeight;
 
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
 
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }
 
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}