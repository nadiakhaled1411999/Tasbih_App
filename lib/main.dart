import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'app.dart';

void main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          "https://9a917d5415ac12ea0a30227662d5c872@o4510938098171904.ingest.us.sentry.io/4510938117767168";
    },
    // Init your App.
    appRunner: () => runApp(const TasbihApp()),
  );
}
