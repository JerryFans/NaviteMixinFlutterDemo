
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/jf_route.dart';
import 'package:flutter_module/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var top = MediaQuery.of(context).padding.top;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'images/bg.jpg',
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            // resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60 + top,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text('手机登录',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            )),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: const Color(0x99ffffff), width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "+86",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: TextField(
                              cursorColor: Colors.white,
                              autofocus: false,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters:  [
                                LengthLimitingTextInputFormatter(11),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                hintText: '输入手机号码',
                                hintStyle: TextStyle(
                                    color: Color(0x99ffffff),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 19.0),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              onChanged: (s) {
                                
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Container(
                          width: 250,
                          height: 50,
                          alignment: Alignment.center,
                          child: const Text('获取验证码',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff010024),
                              )),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xff6e6dff),
                          ),
                        ),
                        onPressed: () async {
                          
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: const Text('帐号密码登录',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            )),
                        onPressed: () {
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: const Text('进入首页',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            )),
                        onPressed: () {
                          JFRoute.pushRoute(JFRoute.nativeMainPage);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}