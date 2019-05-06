import 'package:flutter/material.dart';

///配合AutomaticKeepAliveClientMixin可以keep住
class TopTabBarWidget extends StatefulWidget {
  final List<Widget> tabItems;

  final List<Widget> tabViews;

  final Color backgroundColor;

  final Color indicatorColor;

  final Widget title;

  final Widget drawer;

  final Widget floatingActionButton;

  final TarWidgetControl tarWidgetControl;

  final ValueChanged<int> onPageChanged;

  TopTabBarWidget({
    Key key,
    this.tabItems,
    this.tabViews,
    this.backgroundColor,
    this.indicatorColor,
    this.title,
    this.drawer,
    this.floatingActionButton,
    this.tarWidgetControl,
    this.onPageChanged,
  }) : super(key: key);

  @override
  _TabBarState createState() => new _TabBarState(
        tabViews,
        indicatorColor,
        title,
        drawer,
        floatingActionButton,
        tarWidgetControl,
        onPageChanged,
      );
}

class _TabBarState extends State<TopTabBarWidget>
    with SingleTickerProviderStateMixin {
  final List<Widget> _tabViews;

  final Color _indicatorColor;

  final Widget _title;

  final Widget _drawer;

  final Widget _floatingActionButton;

  final TarWidgetControl _tarWidgetControl;

  final PageController _pageController = PageController();

  final ValueChanged<int> _onPageChanged;

  _TabBarState(
    this._tabViews,
    this._indicatorColor,
    this._title,
    this._drawer,
    this._floatingActionButton,
    this._tarWidgetControl,
    this._onPageChanged,
  ) : super();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(vsync: this, length: widget.tabItems.length);
  }

  ///整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///顶部tab bar
    return new Scaffold(
      floatingActionButton:
          SafeArea(child: _floatingActionButton ?? Container()),
      persistentFooterButtons:
          _tarWidgetControl == null ? [] : _tarWidgetControl.footerButton,
      appBar: new AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: _title,
        bottom: new TabBar(
            controller: _tabController,
            tabs: widget.tabItems,
            indicatorColor: _indicatorColor,
            onTap: (index) {
              _onPageChanged?.call(index);
              _pageController.jumpTo(MediaQuery.of(context).size.width * index);
            }),
      ),
      body: new PageView(
        controller: _pageController,
        children: _tabViews,
        onPageChanged: (index) {
          _tabController.animateTo(index);
          _onPageChanged?.call(index);
        },
      ),
    );
  }
}

class TarWidgetControl {
  List<Widget> footerButton = [];
}

/**
 * 调用
 * _renderTab(icon, text) {
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Icon(icon, size: 16.0), new Text(text)],
      ),
    );
    List<Widget> tabs = [
      _renderTab(SysIcons.HOME, CommonUtils.getLocale(context).home_tab), 
      _renderTab(SysIcons.TRAVEL, CommonUtils.getLocale(context).travel_tab),
      _renderTab(SysIcons.PHOTO, CommonUtils.getLocale(context).photo_tab),
      _renderTab(SysIcons.CUSTOMER, CommonUtils.getLocale(context).customer_tab),
      _renderTab(SysIcons.MY, CommonUtils.getLocale(context).my_tab),
    ];
  }
 */