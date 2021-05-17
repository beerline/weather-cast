import 'package:test/test.dart';
import 'package:weathercast/common/day_of_week.dart';

void main() {
  test('1 is Monday', () {
    final res = DayOfWeek.getWeekDayName(1);
    expect(res, 'Monday');
  });
  test('2 is Tuesday', () {
    final res = DayOfWeek.getWeekDayName(2);
    expect(res, 'Tuesday');
  });
  test('3 is Wednesday', () {
    final res = DayOfWeek.getWeekDayName(3);
    expect(res, 'Wednesday');
  });
  test('4 is Thursday', () {
    final res = DayOfWeek.getWeekDayName(4);
    expect(res, 'Thursday');
  });
  test('5 is Friday', () {
    final res = DayOfWeek.getWeekDayName(5);
    expect(res, 'Friday');
  });
  test('6 is Saturday', () {
    final res = DayOfWeek.getWeekDayName(6);
    expect(res, 'Saturday');
  });
  test('7 is Sunday', () {
    final res = DayOfWeek.getWeekDayName(7);
    expect(res, 'Sunday');
  });
  test('other number is Null', () {
    final moreThanSunday = DayOfWeek.getWeekDayName(8);
    expect(moreThanSunday, null);
    final resZero = DayOfWeek.getWeekDayName(0);
    expect(resZero, null);
    final resNegative = DayOfWeek.getWeekDayName(-1);
    expect(resNegative, null);
  });
}
