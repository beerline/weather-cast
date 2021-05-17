import 'package:flutter/material.dart';
import 'package:weathercast/features/city/domain/usecases/delete/delete_city_cubit.dart';
import 'package:weathercast/features/get_weater/domain/entities/city_weather.dart';
import 'package:weathercast/features/get_weater/domain/usecases/get_city_weather_stream.dart';
import 'package:weathercast/features/get_weater/presentation/screens/city_weather_details.dart';
import 'package:weathercast/injection_container.dart';

class CityWeatherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CityWeather>>(
        stream: serviceLocator<GetCityWeatherStreamUseCase>().watchList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, i) {
              var cityWeather = snapshot.data![i];
              String temp = cityWeather.weather?.main.temp.toString() ?? '--';
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(CityWeatherDetails.ROUTE,
                      arguments: CityWeatherDetailsParam(cityWeather.city));
                },
                child: Dismissible(
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) {
                    serviceLocator<DeleteCityCubit>().delete(cityWeather.city);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                cityWeather.city.name,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              Text('lat: ' +
                                  (cityWeather.city.lat ?? 'no lat')
                                      .toString()),
                              Text('lon: ' +
                                  (cityWeather.city.lon ?? 'no lon').toString())
                            ],
                          ),
                        ),
                        Text(
                          temp + 'C',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  background: Container(
                    color: Colors.red,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                  key: cityWeather.city.id != null
                      ? ValueKey<int>(cityWeather.city.id!)
                      : UniqueKey(),
                ),
              );
            },
          );
        });
  }
}
