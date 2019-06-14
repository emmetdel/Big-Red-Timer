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

void main() {
  // Top button listeners
  pomodoroBtn.onClick.listen(pomodoroBtnClickHandler);
  shortBreakBtn.onClick.listen(shortBreakBtnClickHandler);
  longBreakBtn.onClick.listen(longBreakBtnClickHandler);

  //Bottom button listeners
  playBtn.onClick.listen(playBtnClickHandler);
  stopBtn.onClick.listen(stopBtnClickHandler);
  resetBtn.onClick.listen(resetBtnClickHandler);

  new CountdownTimer(Duration(minutes: 25), timerMinutes, timerSeconds);
}

pomodoroBtnClickHandler(MouseEvent event) {
  print('pomodoroclicked1');
}

shortBreakBtnClickHandler(MouseEvent event) {
  print('shortbreakclicked');
}

longBreakBtnClickHandler(MouseEvent event) {
  print('longbreakclicked');
}

playBtnClickHandler(MouseEvent event) {
  print('playbtnclicked');
}

stopBtnClickHandler(MouseEvent event) {
  print('stopbtnclicked');
}

resetBtnClickHandler(MouseEvent event) {
  print('resetbtnoclicked');
}
