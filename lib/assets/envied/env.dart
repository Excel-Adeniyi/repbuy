import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'lib/assets/env/.env.dev')
abstract class Env {
  @EnviedField(varName: "secret_key", obfuscate: true)
  static final String secretkey = _Env.secretkey;
  @EnviedField(varName: "public_key")
  static const String publickey = _Env.publickey;
  @EnviedField(varName: "baseurl_dev")
  static const String baseurl = _Env.baseurl;
  // @EnviedField(varName: "baseurl_stage")
  // static const String baseurlstage = _Env.baseurlstage;
  @EnviedField(varName: "csp_key")
  static const String cspkey = _Env.cspkey;
  @EnviedField(varName: "jws_key")
  static const String jwskey = _Env.jwskey;
}
