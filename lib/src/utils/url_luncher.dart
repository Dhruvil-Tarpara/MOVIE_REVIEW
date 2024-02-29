import 'package:url_launcher/url_launcher.dart';

Future<bool> urlLuncher(String email) async {
  if (await canLaunchUrl(Uri(scheme: 'mailto', path: email))) {
    await launchUrl(Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Example Subject & Symbols are allowed!',
      }),
    ));
    return true;
  } else {
    return false;
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
