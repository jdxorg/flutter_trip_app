// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_trip_app/main.dart';
import 'package:flutter_trip_app/route/Routes.dart';
import 'package:flutter_trip_app/route/Application.dart';
import 'package:fluro/fluro.dart';

import 'package:redux/redux.dart';
import 'package:flutter_trip_app/redux/app_redux.dart';
import 'package:flutter_trip_app/redux/app_state.dart';
import 'package:flutter_trip_app/redux/middelware.dart';
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;

    Store<AppState> store = new Store<AppState>(
      appReducer,
      initialState: new AppState(
        main: new MainPageState(),
        auth: new AuthState(),
      ),
      middleware: [
        loggingMiddleware,
      ],
    );
    // Build our app and trigger a frame.
    await tester.pumpWidget(FlutterReduxApp(store: store));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
