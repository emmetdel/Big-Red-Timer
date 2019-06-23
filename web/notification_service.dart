import 'dart:html';

import 'package:howler/howler.dart';

class NotificationService {
  Howl howl;
  String message;

  NotificationService(this.message) {
    howl = new Howl(
        src: [
          'sounds/bell.mp3',
        ], // source in MP3 and WAV fallback
        loop: false,
        volume: 0.60 // Play with 60% of original volume.
        );

    // request permission to make notifications to browser
    Notification.requestPermission();
  }

  playNotificationSound() {
    howl.play();
    Notification(message);
  }

  changeNotificationMessage(String message) {
    this.message = message;
  }
}
