import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/weather_forecast.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const TempView({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<WeatherList> forecastList = snapshot.data.list;
    final String icon = forecastList[0].getIconUrl();
    final String temp = forecastList[0].temp.day.toStringAsFixed(0);
    final String description = forecastList[0].weather[0].description;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            icon,
            scale: 0.7,
            color: Colors.black87,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Column(
            children: [
              Text(
                '$temp °C',
                style: TextStyle(
                  fontSize: 54.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$description'.toUpperCase(),
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
