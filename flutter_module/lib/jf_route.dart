import 'package:flutter_boost/flutter_boost.dart';

class JFRoute {
  
  static var loginPage = "jf://loginPage";
  static var nativeMainPage = "jf://nativeMainPage";
  static var nativePage = "jf://nativePage";
  static var demoPage = "jf://demoPage";

  static pushRoute(String url,
      {Map<String, dynamic>? urlParams,
      bool opque = true,
      bool withContainer = true,}) {
    withContainer = true;
    BoostNavigator.instance.push(
        url, //required
        withContainer: withContainer, //optional
        arguments: urlParams, //optional
        opaque: opque, //optional,default value is true
      );
  }

  static popRoute() {
    BoostNavigator.instance.pop();
  }
}