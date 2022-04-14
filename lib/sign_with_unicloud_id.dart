library sign_with_unicloud_id;

import 'dart:async';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:sign_with_unicloud_id/src/auth_config.dart';

class SignWithUnicloudId {
  static AuthConfig? _authConfig;
  late final FlutterAppAuth _appAuth;
  static late final SignWithUnicloudId? _signWithUnicloudId;
  static const _clientId = "unicloud-ca";

  SignWithUnicloudId() {
    _appAuth = FlutterAppAuth();
    _signWithUnicloudId ??= SignWithUnicloudId();
  }

  static SignWithUnicloudId get instance => _signWithUnicloudId!;

  void setConfig({required String redirectUrl}) {
    _authConfig = AuthConfig(redirectUrl: redirectUrl);
  }

  Future<Map<String, dynamic>> authorize() async {
    assert(_authConfig?.redirectUrl == null);
    Completer<Map<String, dynamic>> c = Completer<Map<String, dynamic>>();

    _appAuth
        .authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        _clientId,
        _authConfig?.redirectUrl ?? '',
        serviceConfiguration: AuthConfig.toAuthoServiceConfig(),
      ),
    )
        .then((value) {
      if (value == null) {
        c.complete({});
      } else {
        c.complete({
          "accessToken": value.accessToken,
          "refreshToken": value.refreshToken,
        });
      }
    });

    return c.future;
  }
}
