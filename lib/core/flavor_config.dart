enum Name { hidoc }

enum Environment { dev, prod }

enum Detail { dealer, customer }

class FlavorConfig {
  FlavorConfig._internal(
      {required this.name, required this.environment, required this.detail});

  factory FlavorConfig.init(
      {required Name name,
      Environment environment = Environment.dev,
      Detail detail = Detail.customer}) {
    return _instance ??= FlavorConfig._internal(
        name: name, environment: environment, detail: detail);
  }

  final Name name;
  final Environment environment;
  final Detail detail;

  static FlavorConfig? _instance;

  static FlavorConfig get instance {
    if (_instance == null) {
      throw Exception("---------------------------------------"
          "Please initialize the flavour in the staring the app"
          "FlavorConfig.init(name: name.cars,environment: Environment.name)"
          "---------------------------------------");
    }
    return _instance!;
  }

  bool get isDev => environment == Environment.dev;

  bool get isProd => environment == Environment.prod;

  bool get isCustomer => detail == Detail.customer;

  String get baseUrl {
    switch (environment) {
      case Environment.dev:
        return "http://127.0.0.1:5001/image-attempt-one/us-central1/api/";

      case Environment.prod:
        switch (name) {
          case Name.hidoc:
            // return "https://us-central1-image-attempt-one.cloudfunctions.net/api/";
            // return "https://by4nlqu3yk.execute-api.ap-south-1.amazonaws.com/";
            return "http://devapi.hidoc.co:8080/HidocWebApp/api/";
        }
    }
  }
}
