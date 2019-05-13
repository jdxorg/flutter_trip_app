import 'package:flutter/material.dart';
import 'package:flutter_trip_app/utils/common_utils.dart';
import 'package:flutter_trip_app/common/constraints/sys_style.dart';
class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const c1_width = 150.0,c2_width=100.0, height = 70.0,radius = 15.0,spacing=2.0;
    return new Container(
      margin: const EdgeInsets.only(top: 60.0, left: SysStyle.mainHorizontalPadding, right: SysStyle.mainHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              cell(
                width: c1_width,
                height: height,
                text: CommonUtils.getLocale(context).menu_hotel,
                flex: 0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius),
                  ),
                ),
              ),
              cell(
                width: c2_width,
                height: height,
                text: CommonUtils.getLocale(context).menu_homestay,
                flex: 0,
                margin: const EdgeInsets.symmetric(horizontal: spacing),
                decoration: BoxDecoration(
                  color: Colors.red[300],
                ),
              ),
              cell(
                height: height,
                text: CommonUtils.getLocale(context).menu_ticket,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(radius),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              cell(
                width: c1_width,
                height: height,
                text: CommonUtils.getLocale(context).menu_ari_ticket,
                flex: 0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              cell(
                width: c2_width,
                height: height,
                text: CommonUtils.getLocale(context).menu_railway_ticket,
                flex: 0,
                margin:
                    const EdgeInsets.symmetric(horizontal: spacing, vertical:spacing),
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                ),
              ),
              cell(
                height: height,
                text: CommonUtils.getLocale(context).menu_steamer_ticket,
                margin: const EdgeInsets.only(right: spacing),
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                ),
              ),
              cell(
                height: height,
                text: CommonUtils.getLocale(context).menu_taxi,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              cell(
                width: c1_width,
                height: height,
                text: CommonUtils.getLocale(context).menu_trip,
                flex: 0,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(radius),
                  ),
                ),
              ),
              cell(
                width: c2_width,
                height: height,
                text: CommonUtils.getLocale(context).menu_railway_trip,
                flex: 0,
                margin: const EdgeInsets.symmetric(horizontal: spacing),
                decoration: BoxDecoration(
                  color: Colors.green[300],
                ),
              ),
              cell(
                width: 40,
                height: height,
                text: CommonUtils.getLocale(context).menu_steamer_trip,
                margin: const EdgeInsets.only(right: spacing),
                decoration: BoxDecoration(
                  color: Colors.green[200],
                ),
              ),
              cell(
                width: 40,
                height: height,
                text: CommonUtils.getLocale(context).menu_custom_trip,
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(radius),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget cell(
      {double width,
      double height,
      Color color,
      String text,
      EdgeInsetsGeometry margin,
      BoxDecoration decoration,
      int flex=1}) {
    return new Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        width: width,
        height: height,
        margin: margin,
        decoration: decoration,
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
        ),
      ),
    );
  }
}
