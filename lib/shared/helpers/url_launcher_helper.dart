import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  final UrlLauncherWrapper _urlLauncherWrapper;

  UrlLauncherHelper(this._urlLauncherWrapper);

  Future<void> launchUrlWithExternalApplication(String url) async {
    final uri = Uri.parse(url);

    if (!(await _urlLauncherWrapper.canLaunch(uri))) {
      throw Exception();
    }

    final isLaunched =
    await _urlLauncherWrapper.launch(uri, LaunchMode.externalApplication);
    if (!isLaunched) {
      throw Exception();
    }
  }
}

class UrlLauncherWrapper {
  Future<bool> canLaunch(Uri uri) {
    return canLaunchUrl(uri);
  }

  Future<bool> launch(Uri uri, LaunchMode mode) {
    return launchUrl(uri, mode: mode);
  }
}
