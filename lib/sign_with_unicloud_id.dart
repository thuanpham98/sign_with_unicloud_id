library sign_with_unicloud_id;

import 'dart:async';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:sign_with_unicloud_id/src/auth_config.dart';

class SignWithUnicloudId {
  static AuthConfig? _authConfig;
  late final FlutterAppAuth _appAuth;
  static const _clientId = "unicloud-ca";

  SignWithUnicloudId._() {
    _appAuth = FlutterAppAuth();
  }

  static SignWithUnicloudId get instance => SignWithUnicloudId._();

  void setConfig({required String redirectUrl}) {
    _authConfig = AuthConfig(redirectUrl: redirectUrl);
  }

  Future<Map<String, dynamic>?> authorize() async {
    assert(_authConfig?.redirectUrl != null);

    Map<String, dynamic>? retData;
    AuthorizationTokenResponse? ret = await _appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        _clientId,
        _authConfig?.redirectUrl ?? '',
        serviceConfiguration: AuthConfig.toAuthoServiceConfig(),
      ),
    );
    if (ret != null) {
      retData = {
        "refreshToken": ret.refreshToken,
        "token": ret.accessToken,
      };
    }
    return retData;
  }
}
