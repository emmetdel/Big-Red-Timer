import 'dart:async';
import 'dart:html';

class CountdownTimer {
  Duration durationOfTimer;
  int durationSeconds;

  SpanElement minutes;
  SpanElement seconds;

  Timer timer;

  CountdownTimer(this.minutes, this.seconds, this.durationOfTimer) {
    durationSeconds = durationOfTimer.inSeconds;
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => handleTimer());
  }

  pauseTimer() {
    timer.cancel();
  }

  playTimer() {
    startTimer();
  }

  handleTimer() {
    durationSeconds--;
    if (durationSeconds > 0) {
      setTime();
    }
  }

  setTime() {
    var minute = ((durationSeconds / 60).floor());
    var second = (durationSeconds - (minute * 60));

    var minuteStr = minute.toString();
    var secondStr = second.toString();

    if (second < 10) {
      secondStr = '0$secondStr';
    }

    minutes.text = minuteStr;
    seconds.text = secondStr;
  }
}
