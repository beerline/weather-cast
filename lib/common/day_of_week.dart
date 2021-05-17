class DayOfWeek {
  static const DAY_OF_WEEK_LIST = {
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
    7: 'Sunday',
  };

  static String? getWeekDayName(int dayNumber) {
    return DAY_OF_WEEK_LIST[dayNumber];
  }
}