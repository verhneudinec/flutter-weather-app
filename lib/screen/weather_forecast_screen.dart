import 'package:flutter/material.dart';
import 'package:flutter_weather_app/api/weather_api.dart';
import 'package:flutter_weather_app/model/weather_forecast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key key}) : super(key: key);

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();

    forecastObject =
        WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);

    forecastObject.then((weather) {
      print(weather.list[0].weather[0].main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Weather in $_cityName'),
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {},
        ),
        actions: [
          IconButton(icon: Icon(Icons.location_city), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'All good',
                    style: Theme.of(context).textTheme.headline3,
                  );
                } else {
                  return Center(
                    child: SpinKitDoubleBounce(
                      color: Colors.black,
                      size: 100.0,
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
