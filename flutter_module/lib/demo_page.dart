import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/jf_route.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter二级页面',
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () {
            JFRoute.popRoute();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Center(
            child: Text(
              '二级页面',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          const SizedBox(height: 44,),
          CupertinoButton(
              child: const Text('跳转原生',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              onPressed: () {
                JFRoute.pushRoute(JFRoute.nativePage);
              }),
        ],
      ),
    );
  }
}
