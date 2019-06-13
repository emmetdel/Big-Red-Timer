import 'dart:html';

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
  countdownTimer(5);

  pomodoroBtn.onClick.listen(pomodoroBtnClickHandler);
  shortBreakBtn.onClick.listen(shortBreakBtnClickHandler);
  longBreakBtn.onClick.listen(longBreakBtnClickHandler);

  playBtn.onClick.listen(playBtnClickHandler);
  stopBtn.onClick.listen(stopBtnClickHandler);
  resetBtn.onClick.listen(resetBtnClickHandler);
}

countdownTimer(int time) {
  DateTime timePlusDuration = new DateTime(0).add(new Duration(minutes: time));
  int minutes = timePlusDuration.minute;
  int second = timePlusDuration.second;

  print(minutes);
  print(second);
}

pomodoroBtnClickHandler(MouseEvent event) {}
shortBreakBtnClickHandler(MouseEvent event) {}
longBreakBtnClickHandler(MouseEvent event) {}

playBtnClickHandler(MouseEvent event) {}
stopBtnClickHandler(MouseEvent event) {}
resetBtnClickHandler(MouseEvent event) {}
