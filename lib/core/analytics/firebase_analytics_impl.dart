import 'package:hidoc/core/analytics/analytics.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Analytics)
class FirebaseAnalyticsImpl extends Analytics{
  @override
  void logEvent({required String name, required Object value}) {
  }

  @override
  void logEventWithParam({required String name, Map<String, Object?>? parameters}) {}
}