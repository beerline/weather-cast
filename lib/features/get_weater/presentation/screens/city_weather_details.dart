import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathercast/features/city/domain/entities/city.dart';
import 'package:weathercast/features/get_weater/presentation/bloc/city_weather_details/city_weather_details_cubit.dart';
import 'package:weathercast/features/get_weater/presentation/widgets/city_weather_details.dart';
import 'package:weathercast/injection_container.dart';

class CityWeatherDetails extends StatelessWidget {
  static const ROUTE = '/details';

  const CityWeatherDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cityWeatherCubit = serviceLocator<CityWeatherDetailsCubit>();
    final args = ModalRoute.of(context)!.settings.arguments as CityWeatherDetailsParam;



      return BlocProvider.value(
      value: cityWeatherCubit,
      child:
          BlocBuilder<CityWeatherDetailsCubit, CityWeatherDetailsStateAbstract>(
        builder: (context, state) {
          if (state is CityWeatherDetailsInitial) {
            cityWeatherCubit(args. city);
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CityWeatherDetailsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CityWeatherDetailsLoaded) {
            return CityWeatherDetailWidget(state.weatherDetails, args.city);
          }
          if (state is CityWeatherDetailsError) {
            return Scaffold(
              body: SafeArea(
                child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.message, style: TextStyle(fontSize: 30),),
                        Icon(Icons.error, size: 70, color: Colors.redAccent,)
                      ],
                    )
                ),
              ),
            );
          }

          return Scaffold(
            body: SafeArea(
              child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error', style: TextStyle(fontSize: 30),),
                      Icon(Icons.error, size: 70, color: Colors.redAccent,)
                    ],
                  )
              ),
            ),
          );
        },
      ),
    );
  }
}

class CityWeatherDetailsParam {
  final City city;

  CityWeatherDetailsParam(this.city);
}