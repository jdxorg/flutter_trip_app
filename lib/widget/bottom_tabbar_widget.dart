import 'package:flutter/material.dart';

///配合AutomaticKeepAliveClientMixin可以keep住
class BottomTabBarWidget extends StatefulWidget {
  final List<BottomNavigationBarItem> tabItems;

  final List<Widget> tabViews;

  final Color backgroundColor;

  final int currentIndex;

  final double evelation;

  final BottomNavigationBarType type;

  final Widget title;

  final Widget drawer;

  final Widget floatingActionButton;

  final TarWidgetControl tarWidgetControl;

  final ValueChanged<int> onPageChanged;

  BottomTabBarWidget({
    Key key,
    this.tabItems,
    this.tabViews,
    this.backgroundColor,
    this.currentIndex,
    this.evelation,
    this.type,
    this.title,
    this.drawer,
    this.floatingActionButton,
    this.tarWidgetControl,
    this.onPageChanged,
  }) : super(key: key);

  @override
  _TabBarState createState() => new _TabBarState(
        tabViews,
        currentIndex,
        evelation,
        type,
        title,
        drawer,
        floatingActionButton,
        tarWidgetControl,
        onPageChanged,
      );
}

class _TabBarState extends State<BottomTabBarWidget>
    with SingleTickerProviderStateMixin {
  final List<Widget> _tabViews;

  final int _currentIndex;
  
  final double _evelation;

  final BottomNavigationBarType _type;

  final Widget _title;

  final Widget _drawer;

  final Widget _floatingActionButton;

  final TarWidgetControl _tarWidgetControl;

  final PageController _pageController = PageController();

  final ValueChanged<int> _onPageChanged;

  _TabBarState(
    this._tabViews,
    this._currentIndex,
    this._evelation,
    this._type,
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
    ///底部tab bar
    return new Scaffold(
      drawer: _drawer,
      appBar: new AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: _title,
      ),
      body: new PageView(
        controller: _pageController,
        children: _tabViews,
        onPageChanged: (index) {
          _tabController.animateTo(index);
          _onPageChanged?.call(index);
        },
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: widget.tabItems,
        currentIndex: widget.currentIndex,
        onTap: (index) {
          _onPageChanged?.call(index);
          _pageController.jumpTo(MediaQuery.of(context).size.width * index);
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
 */