import 'package:flutter/material.dart';
import 'package:weathercast/common/day_of_week.dart';
import 'package:weathercast/features/city/domain/entities/city.dart';
import 'package:weathercast/features/get_weater/domain/entities/weather_details.dart';

class CityWeatherDetailWidget extends StatelessWidget {
  final WeatherDetails _weatherDetails;
  final City _city;

  const CityWeatherDetailWidget(this._weatherDetails, this._city, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weather = _weatherDetails.current.weather.first;
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SafeArea(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                        child: Column(
                          children: [
                            Text(
                              _city.name,
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              weather.description,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                            ),
                            _WeatherImage(weather.icon, scale: 2),
                            Text(
                              _weatherDetails.current.temp.toString() + 'C',
                              style: TextStyle(
                                  fontSize: 70, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Today',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey.shade900,
                ),
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _weatherDetails.hourly.length,
                    itemBuilder: (context, i) {
                      final hourly = _weatherDetails.hourly[i];
                      final date = new DateTime.fromMillisecondsSinceEpoch(
                          hourly.dt * 1000);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Text(
                              date.hour.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                            _WeatherImage(weather.icon),
                            Text(
                              hourly.temp.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
              child: Divider(
            color: Colors.grey.shade900,
          )),
          SliverToBoxAdapter(
            child: _DailyRow(
              tempMin: 'Min',
              tempMax: 'Max',
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                final daily = _weatherDetails.daily[i];
                final dailyWeather = daily.weather.first;
                final date =
                    new DateTime.fromMillisecondsSinceEpoch(daily.dt * 1000);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _DailyRow(
                    dayOfWeek: DayOfWeek.getWeekDayName(date.weekday),
                    icon: dailyWeather.icon,
                    tempMin: daily.temp.min.toString(),
                    tempMax: daily.temp.max.toString(),
                  ),
                );
              },
              childCount: _weatherDetails.daily.length,
            ),
          ),
        ]),
      ),
    );
  }
}

class _DailyRow extends StatelessWidget {
  final String? dayOfWeek;
  final String? icon;
  final String? tempMin;
  final String? tempMax;

  const _DailyRow(
      {Key? key, this.dayOfWeek, this.icon, this.tempMin, this.tempMax})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _DailyRowCell(
            Text(
              dayOfWeek ?? '',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            2),
        _DailyRowCell(
          _WeatherImage(icon),
          1,
        ),
        _DailyRowCell(Text((tempMin ?? '')), 1),
        _DailyRowCell(Text((tempMax ?? '')), 1),
      ],
    );
  }
}

class _DailyRowCell extends StatelessWidget {
  final Widget _child;
  final int _flex;

  const _DailyRowCell(
    this._child,
    this._flex, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _child,
        ],
      ),
      flex: _flex,
    );
  }
}

class _WeatherImage extends StatelessWidget {
  final String? icon;
  final int? scale;

  const _WeatherImage(this.icon, {Key? key, this.scale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String scaleParam = '';
    if (scale is int) {
      scaleParam = '@${scale}x';
    }

    if (icon is String) {
      return Image.network(
        'https://openweathermap.org/img/wn/$icon$scaleParam.png',
        errorBuilder: (_, __, ___) {
          return SizedBox();
        },
      );
    } else {
      return SizedBox();
    }
  }
}
