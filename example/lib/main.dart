import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:window_manager/window_manager.dart';

import './pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WindowManager.instance.ensureInitialized();

  // Use it only after calling `hiddenWindowAtLaunch`
  WindowManager.instance.waitUntilReadyToShow().then((_) async {
    await WindowManager.instance.setAsFrameless();
    await WindowManager.instance.setSize(Size(800, 600));
    await WindowManager.instance.center();
    await WindowManager.instance.show();
  });

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff416ff4),
        canvasColor: Colors.white,
        scaffoldBackgroundColor: Color(0xffF7F9FB),
        dividerColor: Colors.grey.withOpacity(0.3),
      ),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      home: HomePage(),
    );
  }
}
