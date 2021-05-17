import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathercast/city_form.dart';
import 'package:weathercast/features/get_weater/presentation/screens/city_weather_details.dart';
import 'package:weathercast/features/get_weater/presentation/screens/city_weather_list.dart';
import 'package:weathercast/features/networkinfo/network_info_cubit.dart';

import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (_) => MyHomePage(title: 'Flutter Weather Cast'),
        CityWeatherDetails.ROUTE: (_) => CityWeatherDetails()
      },
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: 'Flutter Weather cast'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: di.serviceLocator<NetworkInfoAbstract>()),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<NetworkInfoAbstract, NetworkInfoStateAbstract>(
              listener: (context, state) {
                if (state is NetworkInfoNoConnection) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          NetworkInfoNoConnection.MESSAGE,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      backgroundColor: Colors.yellow,
                    ),
                  );
                }
              },
            )
          ],
          child: CityWeatherList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return AnimatedPadding(
                  padding: EdgeInsets.only(bottom: 10),
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.decelerate,
                  child: Container(
                    child: Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CityForm(),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        tooltip: 'add city',
        child: Icon(Icons.add),
      ),
    );
  }
}
