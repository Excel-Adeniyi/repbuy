import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'lib/assets/env/.env.dev')
abstract class Env {
  @EnviedField(varName: "secret_key", obfuscate: true)
  static final String secretkey = _Env.secretkey;
  @EnviedField(varName: "public_key")
  static const String publickey = _Env.publickey;
  @EnviedField(varName: "baseurl")
  static const String baseurl = _Env.baseurl;
}
