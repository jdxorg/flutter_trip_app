import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';   
import 'package:flutter_trip_app/entity/BannerEntity.dart';   
/**
 * Swiper({
    this.itemBuilder,
    this.indicatorLayout: PageIndicatorLayout.NONE,
    ///
    this.transformer,
    @required this.itemCount,                               // 个数
    this.autoplay: false,                                   // 是否自动播放，默认false
    this.layout: SwiperLayout.DEFAULT,                      // 设置样式，后面会介绍，default就是上面轮播的样式
    this.autoplayDelay: kDefaultAutoplayDelayMs,
    this.autoplayDisableOnInteraction: true,                // 用户拖拽的时候，是否停止自动播放
    this.duration: kDefaultAutoplayTransactionDuration,     // 动画时间，默认300.0毫秒
    this.onIndexChanged,                                    // 当用户手动拖拽或自动播放引起下标改变的时候调用
    this.index,                                             // 初始播放轮播时的下标位置
    this.onTap,                                             // 点击轮播的事件
    this.control,                                           // 分页按钮（一般是左右或上下两边的箭头按钮）
    this.loop: true,                                        // 无限轮播模式开关
    this.curve: Curves.ease,                                // 动画的方式
    this.scrollDirection: Axis.horizontal,                  // 滚动方式
    this.pagination,                                        // 分页指示器（下面跟着滚动的点）
    this.plugins,
    this.physics,
    Key key,
    this.controller,
    this.customLayoutOption,

    /// since v1.0.0
    this.containerHeight,
    this.containerWidth,
    this.viewportFraction: 1.0,
    this.itemHeight,
    this.itemWidth,
    this.outer: false,
    this.scale,
    this.fade,
  })
 */
typedef void OnItemTap(int index);
typedef void OnIndexChanged(int index);
class SwiperWidget extends StatefulWidget {
  final List<BannerEntity> imageList;
  final Axis scrollDirection;
  final bool autoplay;
  final double width;
  final double height;
  final OnItemTap onItemTap;
  ///用户改变当前选项触发事件
  final OnIndexChanged onIndexChanged;
  final EdgeInsetsGeometry paginationMargin;
  ///自定义指示器
  final SwiperCustomPagination pagination;
  ///是否使用自定义指示器
  final bool useCustomPagination;
  ///是否显示分页按钮
  final bool showControlButton;
  ///是否显示圆角图片
  final bool showRadius;
  final BorderRadiusGeometry borderRadius;
  SwiperWidget(
    this.imageList,
    {
      this.scrollDirection = Axis.horizontal,
      this.autoplay = true,
      this.width,
      this.height = 300,
      this.paginationMargin = const EdgeInsets.fromLTRB(0, 0, 20, 10),
      this.pagination,
      this.useCustomPagination = false,
      this.showControlButton = false,
      this.showRadius = false,
      this.borderRadius,
      this.onItemTap,
      this.onIndexChanged
    }
  ):assert(imageList!=null,'imageList must not be null');
  @override
  _SwiperViewState createState() => _SwiperViewState(
    this.imageList,
    this.scrollDirection,
    this.autoplay,
    this.width,
    this.height,
    this.paginationMargin,
    this.pagination,
    this.useCustomPagination,
    this.showControlButton,
    this.showRadius,
    this.borderRadius,
    this.onItemTap,
    this.onIndexChanged
  );
}

class _SwiperViewState extends State<SwiperWidget> {
  final List<BannerEntity> _imageList;
  final Axis _scrollDirection;
  final bool _autoplay;
  final double _width;
  final double _height;
  final EdgeInsetsGeometry _paginationMargin;
  final SwiperCustomPagination _pagination;
  final bool _useCustomPagination;
  final bool _showControlButton;
  final bool _showRadius;
  final BorderRadiusGeometry _borderRadius;
  final OnItemTap _onItemTap;
  final OnIndexChanged _onIndexChanged;
  _SwiperViewState(
    this._imageList,
    this._scrollDirection,
    this._autoplay,
    this._width,
    this._height,
    this._paginationMargin,
    this._pagination,
    this._useCustomPagination,
    this._showControlButton,
    this._showRadius,
    this._borderRadius,
    this._onItemTap,
    this._onIndexChanged
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return firstSwiperView();
  }
  
  Widget firstSwiperView() {
    var defaultPagination = SwiperPagination(
        alignment: Alignment.bottomRight,
        margin: _paginationMargin,
        builder: DotSwiperPaginationBuilder(
            color: Colors.black54,// 其他点的颜色
            activeColor: Colors.white,// 当前点的颜色
            space: 3,                           // 点与点之间的距离
            activeSize: 20                      // 当前点的大小
        )
    );
    return Container(
      padding: const EdgeInsets.all(0.0),
      width: _width??MediaQuery.of(context).size.width,
      height: _height,
      child: Swiper(
        itemCount: _imageList.length,
        itemBuilder: _swiperBuilder,
        pagination: _useCustomPagination?_pagination??defaultPagination:defaultPagination,
        controller: SwiperController(),//用于控制 Swiper的index属性, 停止和开始自动播放.
        control: _showControlButton?SwiperControl():null,
        scrollDirection: _scrollDirection,
        autoplay: _autoplay,
        onTap: _onItemTap,
        onIndexChanged: _onIndexChanged,
      ),
    );
  }
  
  Widget _swiperBuilder(BuildContext context, int index) {
    return Container(                     // 用Container实现图片圆角的效果
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_imageList[index].image),  // 图片数组
          fit: BoxFit.cover,
        ),
        borderRadius: !_showRadius?BorderRadius.circular( 0 ):_borderRadius,
      ),
    );
  }
}