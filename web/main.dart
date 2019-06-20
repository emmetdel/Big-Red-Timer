import 'dart:html';

import 'countdown_timer.dart';

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

CountdownTimer timer;

void main() {
  // Top button listeners
  pomodoroBtn.onClick.listen(pomodoroBtnClickHandler);
  shortBreakBtn.onClick.listen(shortBreakBtnClickHandler);
  longBreakBtn.onClick.listen(longBreakBtnClickHandler);

  //Bottom button listeners
  playBtn.onClick.listen(playBtnClickHandler);
  stopBtn.onClick.listen(stopBtnClickHandler);
  resetBtn.onClick.listen(resetBtnClickHandler);

  timer = new CountdownTimer(
      timerMinutes, timerSeconds, Duration(minutes: 25, seconds: 15));
}

pomodoroBtnClickHandler(MouseEvent event) {
  timer.startTimer();
  print('pomodoroclicked1');
}

shortBreakBtnClickHandler(MouseEvent event) {
  // timer.createTimer(Duration(minutes: 5));
  print('shortbreakclicked');
}

longBreakBtnClickHandler(MouseEvent event) {
  // timer.createTimer(Duration(minutes: 10));
  print('longbreakclicked');
}

playBtnClickHandler(MouseEvent event) {
  timer.playTimer();
}

stopBtnClickHandler(MouseEvent event) {
  timer.pauseTimer();
}

resetBtnClickHandler(MouseEvent event) {
  print('resetbtnoclicked');
}
