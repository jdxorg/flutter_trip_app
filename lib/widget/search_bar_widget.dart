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
      {this.hintText,
      this.onChangeCallBack,
      this.onEditingCompleteCallBack,
      this.onSubmitted,
      this.onTap});
  @override
  _State createState() => new _State(this.hintText, this.onChangeCallBack,
      this.onEditingCompleteCallBack, this.onSubmitted, this.onTap);
}

class _State extends State<SearchBarWidget> {
  final String _hintText;
  final OnChangeCallBack _onChangeCallBack;
  final OnEditingCompleteCallBack _onEditingCompleteCallBack;
  final OnSubmitted _onSubmitted;
  final OnTap _onTap;
  _State(this._hintText, this._onChangeCallBack,
      this._onEditingCompleteCallBack, this._onSubmitted, this._onTap);
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 40,
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
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
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
          hintText:
              _hintText ?? CommonUtils.getLocale(context).search_placeholder,
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
          // helperText: 'helperText',
          // errorText: 'errorText',
          // errorBorder: InputBorder.none
          // isDense: false
          border: InputBorder.none,
        ),
        onChanged: _onChangeCallBack,
        onEditingComplete: _onEditingCompleteCallBack,
        onSubmitted: _onSubmitted,
        onTap: _onTap,
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
    );
  }
}
