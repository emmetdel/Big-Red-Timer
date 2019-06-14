import 'dart:async';
import 'dart:html';
import './timer.dart';

// Top Buttons
ButtonElement pomodoroBtn = querySelector('#pomodoro-btn');
ButtonElement shortBreakBtn = querySelector('#short-break-btn');
ButtonElement longBreakBtn = querySelector('#long-break-btn');

//Bottom Button
ButtonElement playBtn = querySelector('#start-btn');
ButtonElement stopBtn = querySelector('#stop-btn');
ButtonElement resetBtn = querySelector('#reset-btn');

SpanElement timerMinutes = querySelector('#timer-minutes');
SpanElement timerSeconds = querySelector('#timer-seconds');

Timer timer;

void main() {
  var time = new CountdownTimer();
  // Top button listeners
  pomodoroBtn.onClick.listen(pomodoroBtnClickHandler);
  shortBreakBtn.onClick.listen(shortBreakBtnClickHandler);
  longBreakBtn.onClick.listen(longBreakBtnClickHandler);

  //Bottom button listeners
  playBtn.onClick.listen(playBtnClickHandler);
  stopBtn.onClick.listen(stopBtnClickHandler);
  resetBtn.onClick.listen(resetBtnClickHandler);
}

countdownTimer(int time) {
  DateTime timePlusDuration = new DateTime(0).add(new Duration(minutes: time));
  var i = 1;

  timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
    var newDuration = timePlusDuration.subtract(Duration(seconds: i));

    int minutes = newDuration.minute;
    int second = newDuration.second;

    timerMinutes.text = minutes.toString();
    timerSeconds.text = second.toString();

    i++;
  });
}

pomodoroBtnClickHandler(MouseEvent event) {
  print('pomodoroclicked');
  if (timer.isActive) {
    timer.cancel();
  }
  timer = countdownTimer(25);
}

shortBreakBtnClickHandler(MouseEvent event) {
  print('shortbreakclicked');
  if (timer.isActive) {
    timer.cancel();
  }

  timer = countdownTimer(5);
}

longBreakBtnClickHandler(MouseEvent event) {
  print('longbreakclicked');
  if (timer.isActive) {
    timer.cancel();
  }
  timer = countdownTimer(10);
}

playBtnClickHandler(MouseEvent event) {
  print('playbtnclicked');
}

stopBtnClickHandler(MouseEvent event) {
  timer.cancel();
  print('stopbtnclicked');
}

resetBtnClickHandler(MouseEvent event) {
  print('resetbtnoclicked');
}
