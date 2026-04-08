# 🚀 Tasbih App (Flutter + Sentry Integration)

A modern and interactive **Tasbih (Sebha) mobile application** built with Flutter, featuring smooth animations, immersive UI, and powerful error monitoring using **Sentry**.

---

## ✨ Features

* 🔢 Smart Tasbih counter (resets every 33)
* 🧠 Dynamic phrase switching
* 🎨 Clean Islamic-themed UI
* 📳 Haptic feedback on tap
* 🌌 Custom Kaaba particle animation 🕋
* 🚀 Animated splash screen
* 🧭 Navigation tracking with breadcrumbs
* 📸 Sentry screenshots on errors
* 🎥 Session Replay for debugging

---

## 🛠️ Tech Stack

* Flutter
* Dart
* CustomPainter (Advanced Animations)
* Sentry (Crash Reporting & Monitoring)

---

## 🧠 Architecture

The app follows a **feature-based clean structure**:

```
lib/
│
├── core/
│   └── constants/
│       └── tasbih_constants.dart
│
├── features/
│   └── tasbih/
│       ├── screens/
│       │   ├── tasbih_screen.dart
│       │   ├── tasbih_splash_screen.dart
│       │   └── test_sentry.dart
│       │
│       └── widgets/
│           └── kaaba_particle_painter.dart
│
├── models/
│   └── kaaba_particle.dart
│
├── app.dart
└── main.dart
```

---

## 📊 Sentry Integration 🔥

This project demonstrates a **real-world integration of Sentry** for monitoring and debugging.

### ✅ Implemented Features:

* 🧯 Crash Reporting
* 🎥 Session Replay
* 📸 Automatic Screenshots (`Sentry_image_output`)
* 🧭 Breadcrumbs (Navigation Tracking)
* 📈 Performance Monitoring

---

## ⚙️ Sentry Configuration

```dart
options.enableAutoSessionTracking = true;
options.tracesSampleRate = 0.1;

options.replay.sessionSampleRate = 1.0;
options.replay.onErrorSampleRate = 1.0;

options.privacy.maskAllText = false;
options.privacy.maskAllImages = false;
```

---

## 🧭 Navigation Tracking

```dart
navigatorObservers: [SentryNavigatorObserver()],
```

This helps track user navigation between screens and reproduce issues easily.

---

## 🎨 Custom Animation System

The app uses a **CustomPainter** to render animated Kaaba particles:

* Random particle spawning
* Velocity & physics simulation
* Rotation animation
* Opacity fading
* Smooth animation using `AnimationController`

---

## 📸 Screenshots

Add your screenshots here 👇

```
![Home Screen](YOUR_IMAGE_LINK)
![Tasbih Screen](YOUR_IMAGE_LINK)
```

---

## 🎥 Demo (Optional)

Add demo video or GIF 👇

```
[Watch Demo](YOUR_VIDEO_LINK)
```

---

## 📹 Sentry Session Replay

Add Sentry replay video or screenshots 👇

```
[Watch Replay](YOUR_VIDEO_LINK)
```

---

## 🚀 Getting Started

```bash
flutter pub get
flutter run
```

---

## ⚠️ Production Note

It is recommended to run Sentry only in release mode:

```dart
if (kReleaseMode) {
  await SentryFlutter.init(...);
}
```

To avoid consuming quota during development.

---

## 💡 Why This Project?

This is not just a simple Tasbih app...

It demonstrates:

* Real-world **error tracking system**
* Advanced **Flutter animations**
* Clean and scalable **architecture**
* Understanding of **production-level tools**

---

## 👩‍💻 Author

**Nadia Khaled**
Flutter Developer 🚀

---

## ⭐ Support

If you like this project, don’t forget to ⭐ the repo!
