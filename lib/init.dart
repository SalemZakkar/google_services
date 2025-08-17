import 'package:google_services/constance.dart';
import 'package:google_services/injection.dart';
import 'package:platform_identity/platform_identity.dart';

Future<void> initGoogleServices({
  String? defaultKey,
  String? androidKey,
  String? iosKey,
  bool? useStrictHeaders,
}) async {
  await configureInjection('ENV');
  await PlatformIdentity.init();
  GoogleServicesConstance.androidKey = androidKey;
  GoogleServicesConstance.sharedKey = defaultKey;
  GoogleServicesConstance.iosKey = iosKey;
  GoogleServicesConstance.useStrictHeaders = useStrictHeaders ?? false;
  await GoogleServicesConstance.setHeaders();
}