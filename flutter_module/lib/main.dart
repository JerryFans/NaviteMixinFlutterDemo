import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/demo_page.dart';

import 'jf_route.dart';
import 'login_page.dart';


void main() {
  CustomFlutterBinding();
  runApp(const MyApp());
}

class CustomFlutterBinding extends WidgetsFlutterBinding
    with BoostFlutterBinding {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  static Map<String, FlutterBoostRouteFactory> pageMap = {
    JFRoute.loginPage: (settings, uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => const LoginPage(
        ),
      );
    },
    JFRoute.demoPage: (settings, uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => const DemoPage(
        ),
      );
    },
  };

  Route<dynamic>? routeFactory(RouteSettings settings, String? uniqueId) {
    FlutterBoostRouteFactory? func = pageMap[settings.name!];
    if (func == null) {
      return null;
    }
    return func(settings, uniqueId ?? "");
  }


  Widget appBuilder(Widget home) {
    return MaterialApp(
      home: home,
      debugShowCheckedModeBanner: true,
      ///必须加上builder参数，否则showDialog等会出问题
      builder: (_, __) {
        return home;
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(
        routeFactory,
        appBuilder: appBuilder,
      );
  }
}