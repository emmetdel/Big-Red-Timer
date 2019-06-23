import 'dart:html';

import 'countdown_timer.dart';
import 'notification_service.dart';

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
NotificationService notifications;

void main() {
  // Top button listeners
  pomodoroBtn.onClick.listen(pomodoroBtnClickHandler);
  shortBreakBtn.onClick.listen(shortBreakBtnClickHandler);
  longBreakBtn.onClick.listen(longBreakBtnClickHandler);

  //Bottom button listeners
  playBtn.onClick.listen(playBtnClickHandler);
  stopBtn.onClick.listen(stopBtnClickHandler);
  resetBtn.onClick.listen(resetBtnClickHandler);

  notifications = new NotificationService("Your time is up. Take a break.");
  timer = new CountdownTimer(timerMinutes, timerSeconds, notifications);
}

pomodoroBtnClickHandler(MouseEvent event) {
  timer.setDuration(Duration(seconds: 5));
  notifications.changeNotificationMessage("Your time is up. Take a break.");
}

shortBreakBtnClickHandler(MouseEvent event) {
  timer.setDuration(Duration(minutes: 5));
  notifications
      .changeNotificationMessage("Your break is up. Get back to work.");
}

longBreakBtnClickHandler(MouseEvent event) {
  timer.setDuration(Duration(minutes: 10));
  notifications
      .changeNotificationMessage("Your break is up. Get back to work.");
}

playBtnClickHandler(MouseEvent event) {
  timer.playTimer();
}

stopBtnClickHandler(MouseEvent event) {
  timer.pauseTimer();
}

resetBtnClickHandler(MouseEvent event) {
  timer.resetTimer();
}
