/**
 * 我的
 */

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_trip_app/redux/app_state.dart';
import 'package:flutter_trip_app/utils/common_utils.dart';

class MyPage extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MyPage'),
      ),
      body:new StoreConnector<AppState, AppState>(
        builder: (BuildContext context, AppState state ) {
          return login(state.auth.isLogin,state.auth.account);
        },
        converter: (Store<AppState> store) {
          return store.state;
        },
      ),
    );
  }

  Widget login(isLogin, account) {
    Widget loginPane;
    if (isLogin) {
      loginPane = new StoreConnector(
          key: new ValueKey("login"),
          builder: (BuildContext context, VoidCallback logout) {
            return new RaisedButton(
              onPressed: logout,
              child: new Text("您好:$account,点击退出"),
            );
          },
          converter: (Store<AppState> store) {
            return () => store.dispatch(Actions.LogoutSuccess);
          });
    } else {
      loginPane = new StoreConnector<AppState, VoidCallback>(
          key: new ValueKey("logout"),
          builder: (BuildContext context, VoidCallback login) {
            return new RaisedButton(
              onPressed: login,
              child: new Text("登录"),
            );
          },
          converter: (Store<AppState> store) {
            return () => CommonUtils.navigateTo(context, '/login');
                // store.dispatch(new LoginSuccessAction(account: "xxx account!"));
          });
    }
    return loginPane;
  }

}
