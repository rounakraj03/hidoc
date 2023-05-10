import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs
// flutter run --flavor househackers
//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 github access token I guess
// flutter clean
// flutter pub upgrade

// iam COnsole secret id for raj
//AKIATNUAHQ4HSXST7TFK
//TCtYbk6ORy4xt+M3uAOP8SQcdfBBCNABh6X6xiI7

@InjectableInit(asExtension: true)
registerDependencies() {
  return _getIt.init();
}

final GetIt _getIt = GetIt.I;

T inject<T extends Object>({
  String? instanceName,
  dynamic param1,
  dynamic param2,
}) =>
    _getIt<T>(instanceName: instanceName, param1: param1, param2: param2);
