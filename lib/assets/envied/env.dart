import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'lib/assets/env/.env.dev')
abstract class Env {
  @EnviedField(varName: "public_key")
  static const String publickey = _Env.publickey;
  @EnviedField(varName: "baseurl_dev")
  static const String baseurl = _Env.baseurl;
  // @EnviedField(varName: "baseurl_stage")
  // static const String baseurlstage = _Env.baseurlstage;
}
