import 'package:flutter_appauth/flutter_appauth.dart';

class AuthConfig {
  static const String authEndPoint =
      "http://unicloud-id.hcm.unicloud.ai/auth/realms/unicloud-id/protocol/openid-connect/auth";
  static const String tokenEndPoint =
      "http://unicloud-id.hcm.unicloud.ai/auth/realms/unicloud-id/protocol/openid-connect/token";
  static const String endSessionEndPoint =
      "http://unicloud-id.hcm.unicloud.ai/auth/realms/unicloud-id/protocol/openid-connect/logout";
  static const String clientId = "unicloud-ca";
  final String redirectUrl;
  AuthConfig({required this.redirectUrl});

  static AuthorizationServiceConfiguration toAuthoServiceConfig() {
    return const AuthorizationServiceConfiguration(
        authorizationEndpoint: authEndPoint,
        tokenEndpoint: tokenEndPoint,
        endSessionEndpoint: endSessionEndPoint);
  }
}
