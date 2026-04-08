import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'app.dart';

void main() async {
  SentryWidgetsFlutterBinding.ensureInitialized();
  await SentryFlutter.init(
    (options) {
      options.dsn =
          "https://9a917d5415ac12ea0a30227662d5c872@o4510938098171904.ingest.us.sentry.io/4510938117767168";

      options.enableAutoSessionTracking = true;
      options.tracesSampleRate = 0.1;
//!

      options.replay.sessionSampleRate = 1.0;
      options.replay.onErrorSampleRate = 1.0;

      options.privacy.maskAllText = false;
      options.privacy.maskAllImages = false;
    },
    // Init your App.
    appRunner: () => runApp(
      SentryWidget(
        child: const TasbihApp(),
      ),
    ),
  );
}




// //! Sentre release mode only And also added some comments for better understanding of the code.
// import 'package:flutter/foundation.dart'; // Required for kReleaseMode
// import 'package:flutter/material.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';
// import 'app.dart';

// void main() async {
//   // Ensure all widgets are bound before Sentry starts 🛠️
//   SentryWidgetsFlutterBinding.ensureInitialized();

//   // Run Sentry only in Release Mode to track real users and save quota 🚀🛡️
//   if (kReleaseMode) {
//     await SentryFlutter.init(
//       (options) {
//         // Unique DSN link that connects your app to your Sentry project 🗺️
//         options.dsn =   "https://9a917d5415ac12ea0a30227662d5c872@o4510938098171904.ingest.us.sentry.io/4510938117767168";

//         // Enable session tracking to know how many users opened the app 🕵️‍♀️
//         options.enableAutoSessionTracking = true;

//         // Monitor 10% of operations to balance between data and performance 📊
//         options.tracesSampleRate = 0.1;

//         // Record a video for 100% of the sessions to see user steps 🎥
//         options.replay.sessionSampleRate = 1.0;
//         // Record a video for 100% of the errors to see exactly what happened 📹
//         options.replay.onErrorSampleRate = 1.0;

//         // If false, text will be visible in replay (Set true for privacy) 🤫
//         options.privacy.maskAllText = false;
//         // If false, images will be visible in replay (Set true for privacy) 🖼️
//         options.privacy.maskAllImages = false;
//       },
//       // appRunner launches your app through Sentry 🚀
//       appRunner: () => runApp(
//         // SentryWidget monitors UI and catches any errors in your widgets 🛡️
//         SentryWidget(
//           child: const TasbihApp(),
//         ),
//       ),
//     );
//   } else {
//     // In Debug Mode, the app runs normally without Sentry 🛠️
//     runApp(const TasbihApp());
//   }
// }
