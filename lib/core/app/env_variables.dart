import 'package:app_shop_ease/core/enums/env_type_enum.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvVariables {
  String envType = '';
  Future<void> init(EnvTypeEnum env) async {
    switch (env) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: ".env.dev");
        break;
      case EnvTypeEnum.prod:
        await dotenv.load(fileName: ".env.prod");
        break;
    }
    envType = dotenv.get("ENV_TYPE");
  }
}
