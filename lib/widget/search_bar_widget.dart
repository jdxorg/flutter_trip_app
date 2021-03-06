import 'package:flutter/material.dart';
import 'package:flutter_trip_app/common/constraints/sys_icons.dart';
import 'package:flutter_trip_app/utils/common_utils.dart';

typedef void OnChangeCallBack(String value);
typedef void OnEditingCompleteCallBack();
typedef void OnSubmitted(String value);
typedef void OnTap();

class SearchBarWidget extends StatefulWidget {
  final String hintText;
  final OnChangeCallBack onChangeCallBack;
  final OnEditingCompleteCallBack onEditingCompleteCallBack;
  final OnSubmitted onSubmitted;
  final OnTap onTap;

  SearchBarWidget(
      {Key key,
      this.hintText,
      this.onChangeCallBack,
      this.onEditingCompleteCallBack,
      this.onSubmitted,
      this.onTap})
      : super(key: key);
  @override
  _State createState() => new _State();
}

class _State extends State<SearchBarWidget> {
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            '深圳',
            style: TextStyle(
              color: Colors.red,
              fontSize: 18,
            ),
          ),
        ),
        Icon(
          SysIcons.JianTou_Down,
          color: Colors.red,
          size: 26,
        ),
        Expanded(
          child: Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
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
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 6.0),
                  prefixIcon: Icon(
                    SysIcons.SEARCH,
                    size: 35,
                    color: Colors.blue,
                  ),
                  suffixIcon: Icon(
                    SysIcons.AUDIO,
                    size: 35,
                    color: Colors.grey,
                  ),
                  hintText: widget.hintText ??
                      CommonUtils.getLocale(context).search_placeholder,
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                  // helperText: 'helperText',
                  // errorText: 'errorText',
                  // errorBorder: InputBorder.none
                  // isDense: false
                  border: InputBorder.none),
              onChanged: widget.onChangeCallBack,
              onEditingComplete: widget.onEditingCompleteCallBack,
              onSubmitted: widget.onSubmitted,
              onTap: widget.onTap,
              // textInputAction: TextInputAction.unspecified,//键盘模式
              // style: TextStyle(
              //   backgroundColor: Colors.red
              // ),
              // strutStyle: StrutStyle.fromTextStyle(TextStyle(backgroundColor: Colors.red)),
              // expands: false,
              // enabled: false,//是否禁用
              // cursorColor: Colors.red,//光标颜色
              // cursorRadius: Radius.circular(20.0),//光标弧度
              // cursorWidth: 10.0,//光标宽度
              // keyboardAppearance: Brightness.light, //没看到效果
              // scrollPadding: EdgeInsets.all(10.0),//没看到效果
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(
            SysIcons.MESSAGE,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
