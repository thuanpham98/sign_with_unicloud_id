import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:sign_with_unicloud_id/sign_with_unicloud_id.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final SignWithUnicloudId signWithUnicloudId;

  @override
  void initState() {
    signWithUnicloudId = SignWithUnicloudId.instance;
    signWithUnicloudId.setConfig(
        redirectUrl: 'vn.unicloudid.auth', clientId: "unicloud-ca");
    super.initState();
  }

  Future<void> _signInWithAutoCodeExchange() async {
    try {
      var ret = await signWithUnicloudId.authorize();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Container(
          child: Platform.isIOS
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text(
                      'Sign in with Unicloud ID(iOS only)',
                      textAlign: TextAlign.center,
                    ),
                    onPressed: _signInWithAutoCodeExchange,
                  ),
                )
              : ElevatedButton(
                  child: const Text('Sign in with Unicloud ID'),
                  onPressed: () => _signInWithAutoCodeExchange(),
                ),
        )),
      ),
    );
  }
}
