import 'dart:async';

import 'dart:html';

class CountdownTimer {
  DateTime _timerDuration;

  SpanElement minute;
  SpanElement seconds;

  int interval = 1;

  Timer timer;

  CountdownTimer(this.minute, this.seconds);

  createTimer(Duration duration) {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
    _timerDuration = new DateTime(0).add(duration);
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => handleTimer(t));
  }

  handleTimer(Timer timer) {
    //create new date time
    var newDuration = _timerDuration.subtract(Duration(seconds: interval));

    //update minutes and seconds
    minute.text = newDuration.minute.toString();
    seconds.text = newDuration.second.toString();

    interval++;
  }

  // updateTimer(String minutes, String seconds) {
  //   minutes = minutes;
  //   seconds = seconds;
  // }

  // _handleTimer() {
  //   print('hit');
  //   // _timerDuration.subtract(Duration(seconds: interval));
  //   // minute = _timerDuration.minute.toString();
  //   // seconds = _timerDuration.second.toString();
  //   // interval++;
  // }
}
