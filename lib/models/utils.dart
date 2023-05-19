class Utils {
  String giveMeTimeFromSecondsFormat(int input) {
    String output = "";
    const int MIN = 60, HRS = 3600, DYS = 84600;
    int days, seconds, minutes, hours, rDays, rHours;
    days = input ~/ DYS;
    rDays = input % DYS;
    hours = rDays ~/ HRS;
    rHours = rDays % HRS;
    minutes = rHours ~/ MIN;
    seconds = rHours % MIN;
    if (input >= DYS) {
      if (hours > 0) {
        output = ("$days d $hours hr");
      } else {
        output = ("$days day");
      }
    } else if (input >= HRS && input < DYS) {
      if (minutes > 0) {
        output = ("$hours hr $minutes min");
      } else {
        output = ("$hours hr");
      }
    } else if (input >= MIN && input < HRS) {
      if (seconds > 0) {
        output = ("$minutes min $seconds sec");
      } else {
        output = ("$minutes min");
      }
    } else if (input < MIN) {
      output = ("$input sec");
    }
    return output;
  }
}
