/// 这个类用来管理登录状态
class AuthState{
  bool isLogin;     //是否登录
  String account;   //用户名
  AuthState({this.isLogin:false,this.account});
}

/// 管理主页状态
class MainPageState{
  int counter;
  MainPageState({this.counter:0});
}

/// 应用程序状态
class AppState{
  AuthState auth;     //登录
  MainPageState main; //主页

  AppState({this.main,this.auth});
}

enum Actions { Increment,Login ,LogoutSuccess, LoginSuccess}

/// 定义所有action的基类
class Action{
  final Actions type;
  Action({this.type});
}

/// 定义Login成功action
class LoginSuccessAction extends Action{

  final String account;

  LoginSuccessAction({this.account}):super( type:Actions.LoginSuccess );
}