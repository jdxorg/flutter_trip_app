import './app_state.dart';
import 'package:redux/redux.dart';
loggingMiddleware(Store<AppState> store, action, NextDispatcher next) {
  print('${new DateTime.now()}: $action');
  next(action);
}