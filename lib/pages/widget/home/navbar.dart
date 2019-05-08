import 'package:flutter/material.dart';
import 'package:flutter_trip_app/entity/NavbarEntity.dart';

class HomeNavBar extends StatelessWidget {
  final List<NavbarEntity> navbars;
  HomeNavBar(
    this.navbars
  );
  @override
  Widget build(BuildContext context) {
    Column getItemContainer(NavbarEntity navbar) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Image(
            image: NetworkImage(navbar.image),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              navbar.name,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    return new Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: new Border.all(
          width: 2.0,
          color: Colors.transparent,
        ),
        borderRadius: new BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 5.0,
          ),
        ],
      ),
      child:GridView.builder(
        itemCount: navbars.length,
        //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //横轴元素个数
            crossAxisCount: 3,
            //纵轴间距
            mainAxisSpacing: 20.0,
            //横轴间距
            crossAxisSpacing: 10.0,
            //子组件宽高长度比例
            childAspectRatio: 1.0),
        itemBuilder: (BuildContext context, int index) {
          return getItemContainer(navbars[index]);
        },),
    );
  }
}
