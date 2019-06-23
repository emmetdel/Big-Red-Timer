import 'dart:async';
import 'dart:html';

import 'notification_service.dart';

class CountdownTimer {
  NotificationService notificationService;

  Duration durationOfTimer = Duration(minutes: 25);
  int durationSeconds;

  SpanElement minutes;
  SpanElement seconds;

  static Timer timer;

  CountdownTimer(this.minutes, this.seconds, this.notificationService);

  startTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
    timer =
        Timer.periodic(Duration(seconds: 1), (Timer t) => _timerInterval(t));
  }

  playTimer() {
    startTimer();
  }

  pauseTimer() {
    if (timer != null) {
      timer.cancel();
    }
  }

  resetTimer() {
    pauseTimer();
    durationSeconds = durationOfTimer.inSeconds;
    _calculateTime();
  }

  setDuration(Duration dura) {
    this.durationOfTimer = dura;
    durationSeconds = durationOfTimer.inSeconds;

    this._calculateTime();
  }

  _calculateTime() {
    var minute = ((durationSeconds / 60).floor());
    var second = (durationSeconds - (minute * 60));

    var minuteStr = minute.toString();
    var secondStr = second.toString();

    if (second < 10) {
      secondStr = '0$secondStr';
    }
    _updateTextTimeOnPage(minuteStr, secondStr);
  }

  _updateTextTimeOnPage(String minutes, String seconds) {
    var title = querySelector("title");
    title.text = "Big Red Timer - ($minutes:$seconds)";
    this.minutes.text = minutes;
    this.seconds.text = seconds;
  }

  _timerInterval(Timer t) {
    durationSeconds--;

    if (durationSeconds >= 0) {
      _calculateTime();
    }

    if (durationSeconds == 0) {
      notificationService.playNotificationSound();
    }
  }
}
